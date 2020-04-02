# 项目目的

1. 在 macOS 的许多软件中,我们都可以看到有 SpiltView 和 TableView 的身影,比较著名的像 Mac 电脑的 App Store, keynote 等等,还有一些三方开发的像 QQ, 微信,这些软件都使用了 SplitView 和 TableView. 下图的 Mac App Store 整个大的框架就是 SpiltView(蓝色框),而在左侧列表就是一个 TableView:

![Screen Shot 2020-04-01 at 20.49.25](https://tva1.sinaimg.cn/large/00831rSTgy1gdekcr27f3j30vn0mpgvv.jpg)

2. 任何一个软件的开发都少不了数据,这些数据可能是软件本身存储的数据,可能是软件运行过程中需要的数据,比如微信的聊天记录就是其存储的数据,而软件的一些诸如图标,按钮名称则是其运行过程中需要的数据.因此我们要考虑一种或多种比较高效的存储数据的方式,方便代码的维护.从简单粗暴的角度上出发,我们的确可以把一些诸如按钮名称,列表内容等写死在程序里,但这会带来一个很明显的问题,万一哪天我们要修改代码,很有可能只是一个数据的改动,就造成了软件的崩溃,甚至是无法运行.在这个简单的 SplitViewDemo 项目中,我们会尝试使用 .plist 文件来存储 TableView 的列表数据,只是为了给读者展示一种使用方法.

# 项目流程

## 新建一个 Xcode 工程并搭建基本框架

打开 Xcode,如果您从来没有开发过任何 Xcode 的项目,那么我们会看到下图这个界面:

![image-20200401211456504](https://tva1.sinaimg.cn/large/00831rSTgy1gdekt9gqboj30nk0ec0v2.jpg)

如果您曾经开发过 Xcode 的项目,那么我们在上图中 No Recent Projects 那里,会看到之前开发过的项目名称.

当然啦,这并不是重点,无论看到哪个,我们都是点击上图中的 **Create a new Xcode project** 来新建一个工程项目.

另外,如果您两个图都没有看到,别担心,您只是之前关闭了这个窗口,我们可以在打开 Xcode 后导航到左上角的菜单栏,然后选择 Window > Welcome to Xcode 就能够显示上图的内容.

![Screen Shot 2020-04-01 at 21.21.45](https://tva1.sinaimg.cn/large/00831rSTgy1gdel2yito9j30l700mq2s.jpg)

![Screen Shot 2020-04-01 at 21.22.56](https://tva1.sinaimg.cn/large/00831rSTgy1gdel37swdtj309k0araae.jpg)

还有一种方法可以直接新建一个 Xcode 工程项目,就是打开 Xcode 后,点击左上角菜单栏中的 File > New > Project, 这样也可以直接新建工程项目.

紧接着 Xcode 会询问我们要创建一个怎样的项目,大类的选择有 iOS, watchOS, tvOS, macOS, Cross-platform, 就像字面意思一样,要开发哪个平台的项目,就选择哪个对应的名字.接着要选择的是在对应平台下,我们要开发具体什么东西,是软件还是游戏,框架还是库.此处我们选择 macOS 下的 App,并点击 Next 以继续.

![image-20200401213045954](https://tva1.sinaimg.cn/large/00831rSTgy1gdel9srswqj30ts0jd403.jpg)

然后是一些基本信息的填写,Product Name 就是字面意思,这个软件叫什么名字,此处我们填写为 SplitViewDemo,Team 就是开发团队,一般来讲我们都需要注册一个开发者账号,当然,如果您开发的软件只是自己用着玩儿,那么可以注册一个免费的开发者账号,如果您想要将自己的软件上架到 App Store,那么您一定要注册一个付费的开发者账号,可以到苹果的[开发者软件](https://apps.apple.com/cn/app/apple-developer/id640199958)去注册,面向大众的开发者是 99 美元一年(已经很良心了),面向企业内部的是 299 美元一年. Organization Name 就是您团队的名字,比如 myCompany, Organization Identifier 一般是在您确定好 Organization Name 后直接生成的,比如 com.myCompany.我们要将 Language 设置为 Swift,因为我们的项目会用 Swift 来编写,User Interface 有三种选项, SwiftUI, Storyboard 和 XIB,建议您选择 Storyboard,因为目前苹果的要求,如果您要上架自己的 App,必须是 Storyboard,然后下面的复选框,暂时都先不勾选,因为我们用不上.

![image-20200401215822346](https://tva1.sinaimg.cn/large/00831rSTgy1gdem2gnlskj30ts0iutcw.jpg)

上图的信息填写好以后,点击 Next,我们需要明确将项目存储在哪里,此处我只是为了演示方便,将项目存放在了桌面上,如果您自己在操作时,建议您把项目放在一个您熟悉的位置,比如 GitHub,或者使用苹果家的 iCloud 功能将其备份好,这一点很重要.

![image-20200401220419284](https://tva1.sinaimg.cn/large/00831rSTgy1gdem8nhf8hj30ts0iujvs.jpg)

选择好合适的路径存储后,点击 Create,就完成了新项目的创建工作.

## 编辑软件的界面

我们先来看看成品的界面:

![image-20200401221231968](https://tva1.sinaimg.cn/large/00831rSTgy1gdemh96t3zj311x0u0ta8.jpg)

很普通对不对,没有任何的美化,但作为演示它足够了,在界面的左侧是一个简单的 TableView,右侧是根据选择不同的列表信息后,对应显示的内容.





































































































# 项目总结































