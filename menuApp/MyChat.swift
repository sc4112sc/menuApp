//
//  MyChat.swift
//  menuApp
//
//  Created by ios on 2018/2/2.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase
import Photos

class MyChat: JSQMessagesViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var masterName = ""
    var phoneId = ""
    
    private lazy var messageRef: DatabaseReference =
        Database.database().reference().child("\(phoneId)/messages")
    private var newMessageRefHandle: DatabaseHandle?
    var messages = [JSQMessage]()
    lazy var outgoingBubbleImageView: JSQMessagesBubbleImage =
        self.setupOutgoingBubble()
    lazy var incomingBubbleImageView: JSQMessagesBubbleImage =
        self.setupIncomingBubble()
    
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
                                 messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.outgoingMessagesBubbleImage(with:
            UIColor.jsq_messageBubbleGreen())
    }
    private func setupIncomingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.incomingMessagesBubbleImage(with:
            UIColor.jsq_messageBubbleLightGray())
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
                                 messageBubbleImageDataForItemAt indexPath: IndexPath!) ->
        JSQMessageBubbleImageDataSource! {
            let message = messages[indexPath.item] // 1
            if message.senderId == senderId { // 2 查看發送者來決定訊息背景
                return outgoingBubbleImageView
            } else { // 3
                return incomingBubbleImageView
            }
            
    }
    
    
    private func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text:
            text) {
             messages.append(message)
        }
        
    }
    
    //送出
    override func didPressSend(_ button: UIButton!, withMessageText text:
        String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let itemRef = messageRef.childByAutoId() // 1
        let messageItem = [ // 2
            "senderId": senderId!,
            "senderName": senderDisplayName!,
            "text": text!,
            ]
        itemRef.setValue(messageItem) // 3
        JSQSystemSoundPlayer.jsq_playMessageSentSound() // 4
        
        
        
        finishSendingMessage() // 5
        
        isTyping = false
        
       
    }
    
    
    private func observeMessages() {
        //        messageRef = channelRef!.child("messages")
        // 1.
        let messageQuery = messageRef.queryLimited(toLast:25)
        // 2. We can use the observe method to listen for new
        // messages being written to the Firebase DB
        newMessageRefHandle = messageQuery.observe(.childAdded, with: { (snapshot) -> Void in
            // 3
            let messageData = snapshot.value as! Dictionary<String, String>
            if let id = messageData["senderId"] as String!, let name = messageData["senderName"]
                as String!, let text = messageData["text"] as String!, text.count > 0 {
                // 4
                self.addMessage(withId: id, name: name, text: text)
                // 5
                
                self.finishReceivingMessage()
            }else if let id = messageData["senderId"] as String!,
                let photoURL = messageData["photoURL"] as String! { // 1
                // 2
                if let mediaItem = JSQPhotoMediaItem(maskAsOutgoing: id == self.senderId) {
                    // 3
                    self.addPhotoMessage(withId: id, key: snapshot.key, mediaItem: mediaItem)
                    // 4
                    if photoURL.hasPrefix("gs://") {
                        self.fetchImageDataAtURL(photoURL, forMediaItem: mediaItem, clearsPhotoMessageMapOnSuccessForKey: nil)
                    }
                }
            }
            
            
            
            else{
            print("Error! Could not decode message data")
            }
            })
        
        
        updateMessageRefHandle = messageRef.observe(.childChanged, with: { (snapshot) in
            let key = snapshot.key
            let messageData = snapshot.value as! Dictionary<String, String> // 1
            
            if let photoURL = messageData["photoURL"] as String! { // 2
                // The photo has been updated.
                if let mediaItem = self.photoMessageMap[key] { // 3
                    self.fetchImageDataAtURL(photoURL, forMediaItem: mediaItem, clearsPhotoMessageMapOnSuccessForKey: key)
                    // 4
                }
            }
        })
        
        
    }
    
    
    override func collectionView(_ collectionView:
        JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!)
        -> JSQMessageAvatarImageDataSource! {
            return nil
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt:
            indexPath) as! JSQMessagesCollectionViewCell
        let message = messages[indexPath.item]
        if message.senderId == senderId {
            cell.textView?.textColor = UIColor.white
        } else {
            cell.textView?.textColor = UIColor.black
        }
        
        
        return cell
    }
    
    
    
    
    override func textViewDidChange(_ textView: UITextView) {
        super.textViewDidChange(textView)
        // If the text is not empty, the user is typing
        isTyping = textView.text != ""
    }
    
    private lazy var userIsTypingRef: DatabaseReference =
       Database.database().reference().child("typingIndicator").child(self.senderId) // 1
    private var localTyping = false // 2
    var isTyping: Bool {
        get {
            return localTyping
        }
        set {
            // 3
            localTyping = newValue
            userIsTypingRef.setValue(newValue)
        }
    }
    
    private func observeTyping() {
        
        let typingIndicatorRef = Database.database().reference().child("typingIndicator")
        userIsTypingRef = typingIndicatorRef.child(senderId)
        userIsTypingRef.onDisconnectRemoveValue()
        
        
        
        
        usersTypingQuery.observe(.value) { (data: DataSnapshot) in
            // 2 You're the only one typing, don't show the indicator
            if data.childrenCount == 1 && self.isTyping {
                return
            }
            
            // 3 Are there others typing?
            self.showTypingIndicator = data.childrenCount > 0
            self.scrollToBottom(animated: true)
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observeTyping()
    }
    
    private lazy var usersTypingQuery: DatabaseQuery = Database.database().reference().child("typingIndicator").queryOrderedByValue().queryEqual(toValue: true)
    
    //storage
    lazy var storageRef = Storage.storage().reference(forURL: "gs://scott1-66559.appspot.com")
    private let imageURLNotSetKey = "NOTSET"
    
    //可能需要一下時間，因此先上傳假的資料
    func sendPhotoMessage() -> String? {
        let itemRef = messageRef.childByAutoId()
        
        let messageItem = [
            "photoURL": imageURLNotSetKey,
            "senderId": senderId!,
        ]
        itemRef.setValue(messageItem)
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        finishSendingMessage()
        return itemRef.key
    }
    
    func setImageURL(_ url: String, forPhotoMessageWithKey key: String){
        let itemRef = messageRef.child(key)
        itemRef.updateChildValues(["photoURL" : url])
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        let picker = UIImagePickerController()
        picker.delegate = self
    
        
        //
        
        let alertController = UIAlertController(title: "請選擇傳送方式", message: "", preferredStyle: .actionSheet)
        
        let ok1 = UIAlertAction(title: "相簿", style: .default) { (UIAlertAction) in
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)){
                
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                
            }else{
                
                picker.sourceType = UIImagePickerControllerSourceType.camera
            }
            
            self.present(picker, animated: true, completion: nil)
        }
        
        let ok2 = UIAlertAction(title: "拍照", style: .default) { (UIAlertAction) in
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
                
                picker.sourceType = UIImagePickerControllerSourceType.camera
                
            }else{
                
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            }
            
            self.present(picker, animated: true, completion: nil)
        }
            let ok3 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alertController.addAction(ok1)
            alertController.addAction(ok2)
            alertController.addAction(ok3)
            present(alertController, animated: true, completion: nil)
       
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let photoReferenceUrl = info[UIImagePickerControllerReferenceURL] as? URL {
            // Handle picking a Photo from the Photo Library
            // 1
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            // 2
            if let key = sendPhotoMessage() {
                // 3
                let imageData = UIImageJPEGRepresentation(image, 1.0)
                // 4
                let imagePath = Auth.auth().currentUser!.uid + "/\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
                // 5
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                // 6
                storageRef.child(imagePath).putData(imageData!, metadata: metadata, completion: { (metadata, error) in
                    if let error = error {
                        print("Error uploading photo: \(error)")
                        return
                    }
                    // 7
                    self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
                })
                
                
                //                storageRef.child(imagePath).put(imageData!, metadata: metadata) { (metadata, error) in
                //                    if let error = error {
                //                        print("Error uploading photo: \(error)")
                //                        return
                //                    }
                //                    // 7
                //                    self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
                //                }
            }
        } else {
            // Handle picking a Photo from the Camera - TODO
            // 1
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            // 2
            if let key = sendPhotoMessage() {
                // 3
                let imageData = UIImageJPEGRepresentation(image, 1.0)
                // 4
                let imagePath = Auth.auth().currentUser!.uid + "/\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
                // 5
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                // 6
                storageRef.child(imagePath).putData(imageData!, metadata: metadata, completion: { (metadata, error) in
                    if let error = error {
                        print("Error uploading photo: \(error)")
                        return
                    }
                    // 7
                    self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
                })
                
                
                //                storageRef.child(imagePath).put(imageData!, metadata: metadata) { (metadata, error) in
                //                    if let error = error {
                //                        print("Error uploading photo: \(error)")
                //                        return
                //                    }
                //                    // 7
                //                    self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
                //                }
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //顯示圖片
    private var photoMessageMap = [String: JSQPhotoMediaItem]()
    
    private func addPhotoMessage(withId id: String, key: String, mediaItem: JSQPhotoMediaItem){
        
        if let message = JSQMessage(senderId: id, displayName: "", media: mediaItem){
            messages.append(message)
            
            if (mediaItem.image == nil){
                photoMessageMap[key] = mediaItem
            }
            
            collectionView.reloadData()
        }
    }
    
    private func fetchImageDataAtURL(_ photoURL: String, forMediaItem mediaItem: JSQPhotoMediaItem, clearsPhotoMessageMapOnSuccessForKey key: String?) {
        // 1
        let storageRef = Storage.storage().reference(forURL: photoURL)
        
        // 2
        storageRef.getData(maxSize: INT64_MAX) { (data, error) in
            if let error = error {
                print("Error downloading image data: \(error)")
                return
            }
            
            // 3
            storageRef.getMetadata(completion: { (metadata, metadataErr) in
                if let error = metadataErr {
                    print("Error downloading metadata: \(error)")
                    return
                }
                
                // 4
                if (metadata?.contentType == "image/gif") {
                    //                    mediaItem.image = UIImage.gifWithData(data!)
                } else {
                    mediaItem.image = UIImage.init(data: data!)
                }
                self.collectionView.reloadData()
                
                // 5
                guard key != nil else {
                    return
                }
                self.photoMessageMap.removeValue(forKey: key!)
            })
        }
    }
    
    private var updateMessageRefHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view.
        self.senderId = Auth.auth().currentUser?.uid
        self.senderDisplayName = CreatUser.loginName
        // No avatars
        collectionView!.collectionViewLayout.incomingAvatarViewSize =
            CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize =
            CGSize.zero
        //        self.senderId = Auth.auth()?.currentUser?.uid
        observeMessages()
        
        
        self.navigationItem.title = masterName
        
        
        // Do any additional setup after loading the view.
        
        

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    deinit {
        if let refHandle = newMessageRefHandle {
            messageRef.removeObserver(withHandle: refHandle)
        }
        
        if let refHandle = updateMessageRefHandle {
            messageRef.removeObserver(withHandle: refHandle)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
