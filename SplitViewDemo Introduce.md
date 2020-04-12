# 项目目的

1. 在 macOS 的许多软件中,我们都可以看到有 SpiltView 和 TableView 的身影,比较著名的像 Mac 电脑的 App Store, keynote 等等,还有一些三方开发的像 QQ, 微信,这些软件都使用了 SplitView 和 TableView. 下图的 Mac App Store 整个大的框架就是 SpiltView(蓝色框),而在左侧列表就是一个 TableView:

![Screen Shot 2020-04-01 at 20.49.25](https://tva1.sinaimg.cn/large/00831rSTgy1gdekcr27f3j30vn0mpgvv.jpg)

2. 任何一个软件的开发都少不了数据,这些数据可能是软件本身存储的数据,可能是软件运行过程中需要的数据,比如微信的聊天记录就是其存储的数据,而软件的一些诸如图标,按钮名称则是其运行过程中需要的数据.因此我们要考虑一种或多种比较高效的存储数据的方式,方便代码的维护.从简单粗暴的角度上出发,我们的确可以把一些诸如按钮名称,列表内容等写死在程序里,但这会带来一个很明显的问题,万一哪天我们要修改代码,很有可能只是一个数据的改动,就造成了软件的崩溃,甚至是无法运行.在这个简单的 SplitViewDemo 项目中,我们会尝试使用 .plist 文件来存储 TableView 的列表数据,只是为了给读者展示一种使用方法.

3. 接下来我们会做一个 SplitViewDemo.app,软件并没有什么特别的功能,选择对应的左侧列表选项后,软件右侧将出现对应的一些文字.

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

如何做出这种效果?在 Xcode 的左侧选择 Main.storyboard,我们会看到这样的界面:

![Screen Shot 2020-04-02 at 21.28.58](https://tva1.sinaimg.cn/large/00831rSTgy1gdfqw22ib5j31c00u0k92.jpg)

在 storyboard 窗口中的 View Controller 窗口是我们不需要的,选中它,然后键盘上按下 Delete,我们会看到这样的界面:

![Screen Shot 2020-04-02 at 21.32.22](https://tva1.sinaimg.cn/large/00831rSTgy1gdfqxyfxynj31c00u01ac.jpg)

接着,我们会像拼接画像一样,把 SplitView 和 TableView 拼接到界面中去.

首先是 Split View Controller,找到 Xcode 右上角的 "+" 图标,点击它,就可以看到系统为我们准备好的各种框架以及一个搜索框,就像这样:

![Screen Shot 2020-04-02 at 21.37.01](https://tva1.sinaimg.cn/large/00831rSTgy1gdfr33v19oj31490u0q5o.jpg)

现在,请搜索一下 Split View Controller 并把它拖出来到 Storyboard 上,然后放手,此时 Storyboard 界面就已经有了 SplitView,那么和它头顶的 Window 有什么关系,如果这时候直接运行 app 就可以看到 SplitView 了么?答案是否定的,我们还需要把 Window 和 SplitView 连接起来,让它们建立关系.

打开 document outline 窗口,这个窗口是所有按钮,框架,标签的一个显示窗口,通过这个窗口我们可以更加方便准确地选择我们真正需要的东西,document outline 窗口就是如下图红色框选中的区域:

![Screen Shot 2020-04-02 at 21.43.04](https://tva1.sinaimg.cn/large/00831rSTgy1gdfrb4z6k5j31c00u0426.jpg)

在 document outline 中选中 Window Controller Scene 下方的 Window Controller,保持它的选中状态,然后键盘上按住 control 键,或者按住鼠标右键,将 Window Controller 拉到 Split View Controller 上,这时会有一条蓝色的线,松手后我们会看到这个:

![Screen Shot 2020-04-02 at 21.50.02](https://tva1.sinaimg.cn/large/00831rSTgy1gdfrgrt8l7j309o04cwee.jpg)

点击选择 window content,这样我们就建立了一个连接,意思就是上面那个 Window,它的内容就是下面这个 Split View,如下图:

![Screen Shot 2020-04-02 at 21.57.51](https://tva1.sinaimg.cn/large/00831rSTgy1gdfroir08gj31c00u0779.jpg)

刚才我们设置了 Split View Controller,现在要做的就是 Table View Controller 了,像添加 Split View Controller 一样,点击右上角的 "+",跟着搜索 Table View,把 Table View 拉出来,放在 Split View Controller 右侧上方的那个 Controller 中,就像下图这样:

![image-20200402230313735](https://tva1.sinaimg.cn/large/00831rSTgy1gdftn388u6j31c00u0dj1.jpg)

跟着我们把 Table View 的那个窗口拉大,直到撑满整个背后的 Controller,就像这样:

![image-20200402231130187](https://tva1.sinaimg.cn/large/00831rSTgy1gdftsww1dcj31c00u0juh.jpg)

这个时候有一个小小的注意点,我们最终成型的 Demo 只有左侧一个 Table,但如果此时运行一下当前的 App,会发现是这样的:

![Screen Shot 2020-04-09 at 21.14.38](https://tva1.sinaimg.cn/large/00831rSTgy1gdntsqzvn6j31180o478m.jpg)

红色圆圈处有两根线,证明左侧实际上有两列 Table,因此我们需要稍微做一些修改,在 document outline 中选中 View Controller Scene > View Controller > Bordered Scroll View - Table View > Clip View > Table View,然后调出它的 Attribute Inspector(快捷键是 option + command+5),把 Columns 的数值调整为 1,就像这样:

![Screen Shot 2020-04-02 at 23.29.40](https://tva1.sinaimg.cn/large/00831rSTgy1gdfuesst0jj31c00u00x5.jpg)

然后再运行一遍，此时我们会发现这个 SplitViewDemo 变成了这样子：

![image-20200409222057788](https://tva1.sinaimg.cn/large/00831rSTgy1gdnvotn630j311y0o4t9b.jpg)

当然，在这个粗糙的界面中，有些东西我们是不要的，就是界面左上角那个 table view 的表头，英文是 header，可以简单粗暴地在 xcode 的设置界面将它关闭，在 document outline 中选择第一个 View Controller Scene 下方的 Table View,跟着在它的 Attribute Inspector 里面把 Headers 的勾选去掉即可，如下图所示：

![Screen Shot 2020-04-09 at 22.26.45](https://tva1.sinaimg.cn/large/00831rSTgy1gdnvy5u1xvj31c00u0x65.jpg)

同样的操作，我们在下方那个 View Controller  的框架中加入 一个 Label，并把它拉大到充满整个框架。

这个时候如果我们再运行一次 SplitViewDemo，就会发现大体的框架都有了，只要把相应的内容填进去，整个软件就可以算大功告成。

既然说到填充内容，我们需要先做一件事情，两个 View Controller Scene 还没有它们的 controller 文件，我们需要创建两个 Controller 文件来控制 SplitViewDemo 中两边显示的内容，左侧是一个列表，右侧是根据选择列表中某个选项后，相应变化的 Label。接下来就是定义 Controller 了，首先选择 Xcode 中的 File > New > File... 将出现以下窗口：

![image-20200410221045212](https://tva1.sinaimg.cn/large/00831rSTgy1gdp1069uhhj30ts0hoac0.jpg)

此处我们需要选择的是 macOS 下的 Cocoa Class,点击 Next 后，按照下面的图示进行设置，注意**一定不要勾选** Also create XIB file for user interface:

![image-20200410223012964](https://tva1.sinaimg.cn/large/00831rSTgy1gdp1kg9jodj30ts0homyk.jpg)

设置好后，再次点击 Next，就需要选择相应的存储位置，一般我们都推荐将所有相关的文件全部存放在一个指定路径下，就像这样：

![image-20200410223702357](https://tva1.sinaimg.cn/large/00831rSTgy1gdp1rjjyn7j30ts0hoq4q.jpg)

此时我们就在 SplitViewDemo.app 这个项目中成功创建了一个 SourceViewController.swift 文件，如下图所示：

![Screen Shot 2020-04-10 at 22.38.59](https://tva1.sinaimg.cn/large/00831rSTgy1gdp1y3qwmvj30ts0eydhv.jpg)

稍后就会用这个文件来控制 SplitViewDemo 左侧列表显示的内容，不过现在我们还要照着上面的方法创建另一个 DetailViewController.swift 文件，具体方法就不赘述了，完成以后应该像下面这个样子：

![Screen Shot 2020-04-10 at 22.46.35](https://tva1.sinaimg.cn/large/00831rSTgy1gdp229rmnyj30ts0dataj.jpg)

两个控制文件都创建好了，Storyboard 里面该有的控件也有了，那就应该让控制文件与控件产生关联，打开 Main.storyboard，并在 document outline 中选择第一个 View Controller Scene 下面的 View Controller Scene，并打开其 Identity Inspector，在 **Custom Class** 中将 Class 设置成 SourceViewController，如下图：

![Screen Shot 2020-04-10 at 22.54.57](https://tva1.sinaimg.cn/large/00831rSTgy1gdp2b1djnvj311z0oy0vu.jpg)

如果我们细心一点就会发现，document outline 中的第一个 View Controller Scene 名字已经变成了 Source View Controller，同时在 Storyboard 中，Split View Controller 下方左侧的 View Controller 灰色字，也变成了 Source View Controller，同样的道理，我们再来一次，这次去设置 Detail View Controller。

接着我们需要告诉 Table View，它显示的内容，都被控制的方式，都来自 Souce View Controller，所以在document outline 中，选中 Source View Controller Scene 下面的 Table View，再在键盘上按住 Ctrl 键别松手，把 Table View 拖到 Source View Controller 上去，这时我们会看到：

![image-20200410231006652](https://tva1.sinaimg.cn/large/00831rSTgy1gdp2pxs232j307y09iwep.jpg)

要建立连接，就需要选中 dataSource 和 delegate，连续两次按照上面的操作执行即可。还没完，我们在 SourceViewController.swift 文件中，还需要进行一点小小的修改，把下面这段代码：

```swift
class SourceViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
}
```

修改成这个样子：

```swift
class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }   
}
```

也就是在 NSViewController 的后面，多加了NSTableViewDataSource 和 NSTableViewDelegate，请注意用逗号隔开。这个时候，整个项目的框架部分算是搭好了，只要我们把一些相应的内容填充进去，SplitViewDemo 就会显示我们需要的内容，不过我们得注意的一个点是整个界面的大小，如果我们将 SplitViewDemo 的窗口拉大或者缩小，就会看到它并没有匹配到相应的大小变化，对于这一点，暂时不用去管它，我们会在稍后进行修改。

# 填充具体内容

我们打开 Main.storboard，接下来要选择一些内容，请注意如果要选择某个 Label，或者某个 TableView，都尽量在 document outline 中进行选择，这样能够减少出错的概率。好了，我们当前要在 document outline 中选择的是 Source View Controller Scene 下的 Table View，此时打开 assistant 编辑页面，如果一切顺利，我们会同时打开 Storyboard 和 SourceViewController 的编辑页面，就像下面图中的样子：

![image-20200411105256567](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdpn19l5rbj31zy0u0jx1.jpg)

选中 Table View 的前提下，按住键盘上的 Ctrl 键，把 Table View 拖出来，拖到 SourceViewController 编辑页面中，并处于 override func viewDidLoad() 的上方，就像下面图中这个样子，然后松手：

![Screen Shot 2020-04-11 at 10.57.39](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdpn6m642pj31z40u0q8w.jpg)

这个时候我们会看到 Xcode 询问我们要建立一个怎样的连接，是 outlet 还是 action，如果是 outlet，那么它的意思就相当于“参数”，如果是 action，它的意思就相当于操作，会在点击或者按住后执行相应的行为。我们要设置为 outlet，把 name 设置为 tableView，其它的用默认就好：

![Screen Shot 2020-04-11 at 11.06.37](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdq4otxuanj30y90lowhu.jpg)

同样的操作，这次我们先在 document outline 中选择 Detail View Controller Scene 下的 Label，如果不出意外，那么 assistant 界面会变成 DetailViewController 的代码界面，按住 Ctrl 把 Label 拉到 override func viewDidLoad 的上方，Connection 还是选择 outlet，把 name 设置为 labelText，最后它应该像这个样子：

![image-20200411220444238](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdq6g87e04j319a0srn12.jpg)

这个时候我们回到 Main.storyboard ，在 document outline 中点选 Source View Controller Scene，那么 assistant 界面会出现 SourceViewController 的代码界面，在 override func viewDidLoad 这个函数的下方添加一个函数，叫 numberOfRows，就像下面这样：

```swift
class SourceViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
  // 以下就是我们要添加的 numberOfRows 函数
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
}
```

然后再运行一下 SplitViewDemo，不出意外的话，我们看到的画面是这样的：

![image-20200411223632100](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdq7daql2ij31b80o2q4q.jpg)

左侧的 table 列表中会出现 100 个 Table View Cell，也就是说 numberOfRows 决定了列表一共有多少行，当然也可能出现一些意外，比如运行时没有任何显示，一片空白，此时建议读者回顾一下，看是否没有在 document outline 中设置 DataSource 和 Delegate，或者在代码里面是不是少了 NSTableViewDataSource 和 NSTableViewDelegate。如果没什么问题，我们继续看看这个 numberOfRows，在实际工作中我们肯定是要动态地确定到底有多少行，而不是写死代码说它就 100 行，而且每行到底显示些什么东西？数据从哪里来？ 这些都是会变化的，我们可以考虑从 excel 读取数据，从 json 读取数据等等，此处显示时我们会从 plist 文件读取数据，那么接下来就是要在 SplitViewDemo 这个项目中加入一个 plist 文件来放数据，具体操作如下：

1. 在 Xcode 中选择屏幕左上角的 File > New > File... 快捷键是 ⌘N；

![Screen Shot 2020-04-12 at 14.24.54](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdqytd5673j31c00u0gp7.jpg)

2. Xcode 将弹出一个窗口询问我们要创建什么文件，与之前创建 SourceViewController 文件的窗口一样，这里我们要选择的是 macOS 下的 Property List，它在 Resource 这个大分类下方；

![image-20200412143139328](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdqyz55w98j31c00u0dix.jpg)

3. 点击 Next，Save As 那里把名字设置为 LanguageList，其它的与下图保持一致，然后点击 Create，这样就创建好了一个 plist 文件；

![image-20200412143227029](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdqyzz0m0pj31c00u0dis.jpg)

4. 在创建的 Language.plist 文件中，我们点击 Root 旁边的加号，就可以新建信息，要新建的内容可以看看下面的表格：

![Screen Shot 2020-04-12 at 14.55.33](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdqzpa1tpuj30fi02ydft.jpg)

|     语言     |                             内容                             |
| :----------: | :----------------------------------------------------------: |
|   简体中文   | 凤凰台上凤凰游，凤去台空江自流。<br/>吴宫花草埋幽径，晋代衣冠成古丘。<br/>三山半落青天外，二水中分白鹭洲。<br/>总为浮云能蔽日，长安不见使人愁。<br/> |
|   繁體中文   |                飛雪連天射白鹿,笑書神俠倚碧鴛                 |
|   English    | e hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty, and the pursuit of Happiness. |
|   Deutsch    | Sonne kann nicht ohne Schein, Mensch nicht ohne Liebe sein.  |
| русский язык |                 где есть жизнь, есть счастье                 |
| Le français  | Je ne suis pas d'accord avec ce que vous dites, mais je me battrai jusqu'à la mort pour que vous ayez le droit de le dire. |

不用去管这些文字的内容，我只是随意用一些翻译软件找了一些各个语言中比较有名的语句，如果有任何纰漏，忽略就好，但如果有任何冒犯，请让我知道。总之，我们的 plist 文件创建好了之后是这个样子的：

![image-20200412151942845](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdr0d3xxg3j31710sr40v.jpg)

每一种语言会对应它后面的一句话，这个形式有点像是字典

```swift
var someDictionary:[String:String] = [:]
```

另外，我们只想要把字典的键显示在 table view 中，字典的值根据所选键的不同显示在 Label 里面，那么我们需要一个数组来存储所有的键，

```swift
var languageList:[String] = []
    var languageDictionary:[String:String] = [:]
```

所有的数据都是来自这个 plist 文件，我们还需要一个办法通过 SourceViewController 来读取 LanguageList.plist 文件，其实也很简单，只要一句代码：

```swift
let languageDic = Bundle.main.path(forResource: "languageList",ofType:"plist")
```

读取成功后，就需要把键值对存入一个字典，把键存入一个数组，方便取用:

```swift
let dic = NSDictionary(contentsOfFile: languageDic!)
for (key,value) in dic! {
 languageDictionary.updateValue(value as! String, forKey: key as! String)
}
for key in languageDictionary.keys 
{
 languageList.append(key)
}
```

这个时候，我们知道了要显示的具体内容，也知道要显示多少排，那么刚才的 numberOfRows 函数就可以改一改了：

```swift
func numberOfRows(in tableView: NSTableView) -> Int {
        return languageDictionary.count
}
```

目前为止，在 SourceViewController 中的代码应该看起来是这个样子：

![image-20200412162620894](https://tva1.sinaimg.cn/large/007S8ZIlgy1gdr2afoxxqj30jt0buwfr.jpg)













































































































# 项目总结































