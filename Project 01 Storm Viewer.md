# Project 1 Storm Viewer1

Get started coding in Swift by making an image viewer app and learning key concepts.

In this chapter, we will create a simple app step by step, to make sure that I can do it myself in the future.

# Launch Xcode and create a project

## Open Xcode.app and create the basic information

When you launch Xcode.app, it looks like this:

![xcodelaunchwindow](https://tva1.sinaimg.cn/large/0082zybpgy1gc6dr5y34tj30nk0ecmxx.jpg)

Do not care about the white area on the right side, they are just some test projects I create long ago.

- Click **Create a new Xcode project** on the bottom left, then Xcode will show us a page like below, choose macOS on the top, and choose App in the Application frame,click next on the bottom right.

![image-20200223155305651](https://tva1.sinaimg.cn/large/0082zybpgy1gc6dyok2a5j30ts0jrjw2.jpg) 

- Xcode will ask us some information it needs, please check as below:

  - on the **Product Name text field**,enter our project name "StormView"; 
  - choose **Team** as none;
  - choose **Organization Name** whatever you like;
  - don't DIY the **Organization Identifier**, Xcode will do it for us;
  - choose **Language** as Swift;
  - **User Interface** choose Storyboard;
  - uncheck the **Create Document-Based Application**;
  - leave Document Extension as empty;
  - uncheck **Use Core Data**;
  - uncheck **Use CloudKit**;
  - uncheck **Include Unit Tests**;
  - uncheck **Include UI Tests**.

  Finally your choice will like below:

![Untitled](https://tva1.sinaimg.cn/large/0082zybpgy1gc6enhylcqj30sk0ijmyb.jpg)

- Next page, Xcode will ask where to store this project, find a path to store it, that's simple, or you can create a **New Folder** to store it:

![image-20200223162030535](https://tva1.sinaimg.cn/large/0082zybpgy1gc6er9bv1oj30sk0ijq43.jpg)

Finally, your Xcode interface will look like this:

![image-20200223162424297](https://tva1.sinaimg.cn/large/0082zybpgy1gc6evazge2j31g40tqacv.jpg)

## Modify the User Interface

- Delete the only View Controller Scene in the Document outline, choose it and press **Backspace** on your keyboard, if you don't see the Document outline, go to Editor > Document outline, finally it looks like this:

![image-20200223164017871](https://tva1.sinaimg.cn/large/0082zybpgy1gc6fbvc046j31ek0u0ju9.jpg)

- On the right top of your Xcode, there is an ＋ symbol,click it and xcode will show us a window to choose, and you can enter the keywords "split", please choose **Vertical Split View Controller** and drag it into the Interface Builder:

![image-20200223164439848](https://tva1.sinaimg.cn/large/0082zybpgy1gc6fge023kj30k70f2wf7.jpg)

​	then our Xcode looks like this:

![image-20200223164818707](https://tva1.sinaimg.cn/large/0082zybpgy1gc6fk6vq6gj31fg0u0n0u.jpg)

- Make connection between the Window Controller and Split View Controller. You can see the **Window Controller** in the **Document Outline**, keep pressing ctrl on your keyboard, and then drag the **Window Controller** from the **Document Outline** to the Split View frame in the Interface Builder,and then choose on the pop up black window:

![Screen Shot 2020-02-23 at 16.56.36](https://tva1.sinaimg.cn/large/0082zybpgy1gc6ftba4frj31z40u04du.jpg)

![Screen Shot 2020-02-23 at 16.57.47](https://tva1.sinaimg.cn/large/0082zybpgy1gc6fu8ni06j30f30bk0t4.jpg)

This will make a connection between the **Window Controller** and the **Split View Controller**, and if you can press "cmd + R" on your keyboard to run this app, it will show you a window like this:

![image-20200223170120455](https://tva1.sinaimg.cn/large/0082zybpgy1gc6fxpz5wuj30qx0au0sr.jpg)

## Set View Controller

There are two windows on the right side, the one on top should be the list of a table, the one on bottom should be the detail picture.

### Set SourceView Controller

- Open File > New > File, a window shows up like this:

  ![image-20200223204311828](https://tva1.sinaimg.cn/large/0082zybpgy1gc6mcljo43j311e0kmtb4.jpg)

- Choose Cocoa Class under macOS, click "next"
- Create the Class:
  - Enter "SourceViewController" in Class;
  - Enter "NSViewController" in Subclass of;
  - **Uncheck** the "Also create XIB file for user interface"
  - Choose "Swift" in Language.

![image-20200223204715888](https://tva1.sinaimg.cn/large/0082zybpgy1gc6mgtrtxxj311e0km765.jpg)

- Save the SorceViewCtroller.swift file as below, then choose "Create" button:

![image-20200223204832378](https://tva1.sinaimg.cn/large/0082zybpgy1gc6mi4jvvnj311e0kmtas.jpg)

### Set DetailView Controller

- Open File > New > File;
- Choose Cocoa Class under macOS;
- Create the class:
  - Enter "DetailViewController" in Class;
  - Enter "NSViewController" in Subclass of;
  - **Uncheck** the "Also create XIB file for user interface"
  - Choose "Swift" in Language.

- Save the DetailViewController.swift file, choose "Create" button.

## Make Connection between two view controllers and two ViewController.swift files

### Connect SourceViewController to View Controller window

- Click Main.storyboard;
- open the Document Outline;
- Choose View Controller under the first View Controller Scene;
- Click the Identity Inspector on the top right of Xcode;
- In Custom Class, change the class from gray NSViewController to SourceViewController.

![Screen Shot 2020-02-23 at 20.59.50](https://tva1.sinaimg.cn/large/0082zybpgy1gc6n3dkbwqj31ff0u046b.jpg)



### Connect DetailViewController to View Controller window





























































































# Make the StormViem app more beautiful



































































































