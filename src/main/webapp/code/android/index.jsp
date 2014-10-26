<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/header.jsp"%>







<p>Android开源项目系列汇总已完成，包括：</p>
<p><a title="Android开源项目第一篇——个性化控件(View)篇" href="http://www.trinea.cn/android/android-open-source-projects-view/" target="_blank">Android开源项目第一篇——个性化控件(View)篇</a><br />
<a title="Android开源项目第二篇——工具库篇" href="http://www.trinea.cn/android/android-open-source-projects-dev-lib/" target="_blank">Android开源项目第二篇——工具库篇</a><br />
<a title="Android开源项目第三篇——优秀项目篇" href="http://www.trinea.cn/android/android-open-source-projects-excellent-project/" target="_blank">Android开源项目第三篇——优秀项目篇</a><br />
<a title="Android开源项目第四篇——开发及测试工具篇" href="http://www.trinea.cn/android/android-open-source-projects-dev-tool/" target="_blank">Android开源项目第四篇——开发及测试工具篇</a><br />
<a title="Android开源项目第五篇——优秀个人和团体篇" href="http://www.trinea.cn/android/android-open-source-projects-excellent-personal-group/" target="_blank">Android开源项目第五篇——优秀个人和团体篇</a></p>
<p>&nbsp;</p>
<p>本文中你可以找到那些精美App中各种有特性的View，如Gmail的左滑出菜单、Google plus的卡片式ListView，Pinterest的瀑布流，微信的左滑删除，微博的个页面下拉刷新等等。长期更新，欢迎大家补充和推荐^_^</p>
<p>&nbsp;</p>
<p><strong>一、ListView</strong></p>
<p><strong>1. android-pulltorefresh 一个强大的拉动刷新开源项目，支持各种控件下拉刷新</strong></p>
<p>ListView、ViewPager、WevView、ExpandableListView、GridView、(Horizontal<br />
)ScrollView、Fragment上下左右拉动刷新，比下面johannilsson那个只支持ListView的强大的多。并且他实现的下拉刷新ListView在item不足一屏情况下也不会显示刷新提示，体验更好。<br />
项目地址：<a title="https://github.com/chrisbanes/Android-PullToRefresh" href="https://github.com/chrisbanes/Android-PullToRefresh" target="_blank">https://github.com/chrisbanes/Android-PullToRefresh</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true</a></p>
<p>APP示例：新浪微博各个页面</p>
<p>&nbsp;</p>
<p><strong>2. android-pulltorefresh-listview 下拉刷新ListView</strong><br />
项目地址：<a title="https://github.com/johannilsson/android-pulltorefresh" href="https://github.com/johannilsson/android-pulltorefresh" target="_blank">https://github.com/johannilsson/android-pulltorefresh</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refresh-listview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refresh-listview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refresh-listview-demo.apk?raw=true</a><br />
PS：这个被很多人使用的项目实际有不少bug，推荐使用上面的android-pulltorefresh</p>
<p>&nbsp;</p>
<p><strong>3. DropDownListView 下拉刷新及滑动到底部加载更多ListView</strong><br />
项目地址：<a title="https://github.com/Trinea/AndroidCommon" href="https://github.com/Trinea/AndroidCommon" target="_blank">https://github.com/Trinea/AndroidCommon</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/TrineaAndroidDemo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/TrineaAndroidDemo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/TrineaAndroidDemo.apk?raw=true</a><br />
文档介绍：<a title="http://www.trinea.cn/?p=523" href="http://www.trinea.cn/?p=523" target="_blank">http://www.trinea.cn/?p=523</a></p>
<p>&nbsp;</p>
<p><strong>4. DragSortListView 拖动排序的ListView</strong></p>
<p>同时支持ListView滑动item删除，各个Item高度不一、单选、复选、CursorAdapter做为适配器、拖动背景变化等<br />
项目地址：<a title="https://github.com/bauerca/drag-sort-listview" href="https://github.com/bauerca/drag-sort-listview" target="_blank">https://github.com/bauerca/drag-sort-listview</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.mobeta.android.demodslv" href="https://play.google.com/store/apps/details?id=com.mobeta.android.demodslv" target="_blank">https://play.google.com/store/apps/details?id=com.mobeta.android.demodslv</a><br />
APP示例：Wordpress Android</p>
<p>&nbsp;</p>
<p><strong>5. SwipeListView 支持定义ListView左右滑动事件，支持左右滑动位移，支持定义动画时间</strong><br />
项目地址：<a title="https://github.com/47deg/android-swipelistview" href="https://github.com/47deg/android-swipelistview" target="_blank">https://github.com/47deg/android-swipelistview</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.fortysevendeg.android.swipelistview" href="https://play.google.com/store/apps/details?id=com.fortysevendeg.android.swipelistview" target="_blank">https://play.google.com/store/apps/details?id=com.fortysevendeg.android.swipelistview</a><br />
APP示例：微信</p>
<p>&nbsp;</p>
<p><strong>6. Android-SwipeToDismiss 滑动Item消失ListView</strong><br />
项目地址：<a title="https://github.com/romannurik/Android-SwipeToDismiss" href="https://github.com/romannurik/Android-SwipeToDismiss" target="_blank">https://github.com/romannurik/Android-SwipeToDismiss</a><br />
支持3.0以下版本见：<a title="https://github.com/JakeWharton/SwipeToDismissNOA" href="https://github.com/JakeWharton/SwipeToDismissNOA" target="_blank">https://github.com/JakeWharton/SwipeToDismissNOA</a><br />
Demo地址：<a title="https://github.com/JakeWharton/SwipeToDismissNOA/SwipeToDismissNOA.apk/qr_code" href="https://github.com/JakeWharton/SwipeToDismissNOA/SwipeToDismissNOA.apk/qr_code" target="_blank">https://github.com/JakeWharton/SwipeToDismissNOA/SwipeToDismissNOA.apk/qr_code</a></p>
<p>&nbsp;</p>
<p><strong>7. StickyListHeaders GroupName滑动到顶端时会固定不动直到另外一个GroupName到达顶端的ExpandListView，支持快速滑动，支持Android2.3及以上</strong></p>
<p>项目地址：<a title="https://github.com/emilsjolander/StickyListHeaders" href="https://github.com/emilsjolander/StickyListHeaders" target="_blank">https://github.com/emilsjolander/StickyListHeaders</a></p>
<p>APP示例：Android 4.0联系人</p>
<p>效果图：<a href="https://raw.github.com/emilsjolander/StickyListHeaders/master/demo.gif">https://raw.github.com/emilsjolander/StickyListHeaders/master/demo.gif</a></p>
<p>&nbsp;</p>
<p><strong>8. pinned-section-listview GroupName滑动到顶端时会固定不动直到另外一个GroupName到达顶端的ExpandListView</strong><br />
项目地址：<a title="https://github.com/beworker/pinned-section-listview" href="https://github.com/beworker/pinned-section-listview" target="_blank">https://github.com/beworker/pinned-section-listview</a><br />
效果图：<a title="https://raw.github.com/beworker/pinned-section-listview/master/screen1.png" href="https://raw.github.com/beworker/pinned-section-listview/master/screen1.png" target="_blank">https://raw.github.com/beworker/pinned-section-listview/master/screen1.png</a></p>
<p>&nbsp;</p>
<p><strong>9. PinnedHeaderListView GroupName滑动到顶端时会固定不动直到另外一个GroupName到达顶端的ExpandListView</strong><br />
项目地址：<a title="https://github.com/JimiSmith/PinnedHeaderListView" href="https://github.com/JimiSmith/PinnedHeaderListView" target="_blank">https://github.com/JimiSmith/PinnedHeaderListView</a></p>
<p>&nbsp;</p>
<p><strong>10. QuickReturnHeader ListView/ScrollView的header或<strong>footer</strong>，当向下滚动时消失，向上滚动时出现</strong><br />
项目地址：<a title="https://github.com/ManuelPeinado/QuickReturnHeader" href="https://github.com/ManuelPeinado/QuickReturnHeader" target="_blank">https://github.com/ManuelPeinado/QuickReturnHeader</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/quick-return-header-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/quick-return-header-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/quick-return-header-demo.apk?raw=true</a><br />
APP示例：google plus</p>
<p>&nbsp;</p>
<p><strong> 11. IndexableListView ListView右侧会显示item首字母快捷索引，点击可快速滑动到某个item</strong></p>
<p>项目地址：<a title="https://github.com/woozzu/IndexableListView" href="https://github.com/woozzu/IndexableListView" target="_blank">https://github.com/woozzu/IndexableListView</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/indexable-listview.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/indexable-listview.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/indexable-listview.apk?raw=true</a><br />
APP示例：微信通讯录、小米联系人</p>
<p>&nbsp;</p>
<p><strong>12. CustomFastScrollView ListView快速滑动，同时屏幕中间PopupWindows显示滑动到的item内容或首字母</strong><br />
项目地址：<a title="https://github.com/nolanlawson/CustomFastScrollViewDemo" href="https://github.com/nolanlawson/CustomFastScrollViewDemo" target="_blank">https://github.com/nolanlawson/CustomFastScrollViewDemo</a><br />
效果图：<a title="https://raw.github.com/nolanlawson/CustomFastScrollViewDemo/master/example.png" href="https://raw.github.com/nolanlawson/CustomFastScrollViewDemo/master/example.png" target="_blank">https://raw.github.com/nolanlawson/CustomFastScrollViewDemo/master/example.png</a></p>
<p>&nbsp;</p>
<p><strong>13. Android-ScrollBarPanel ListView滑动时固定的Panel指示显示在scrollbar旁边</strong><br />
项目地址：<a title="https://github.com/rno/Android-ScrollBarPanel" href="https://github.com/rno/Android-ScrollBarPanel" target="_blank">https://github.com/rno/Android-ScrollBarPanel</a><br />
效果展示：<a title="https://github.com/rno/Android-ScrollBarPanel/raw/master/demo_capture.png" href="https://github.com/rno/Android-ScrollBarPanel/raw/master/demo_capture.png" target="_blank">https://github.com/rno/Android-ScrollBarPanel/raw/master/demo_capture.png</a></p>
<p>&nbsp;</p>
<p><strong>14. SlideExpandableListView 用户点击listView item滑出固定区域，其他item的区域收缩</strong><br />
项目地址：<a title="https://github.com/tjerkw/Android-SlideExpandableListView" href="https://github.com/tjerkw/Android-SlideExpandableListView" target="_blank">https://github.com/tjerkw/Android-SlideExpandableListView</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/slide-expandable-listView-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/slide-expandable-listView-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/slide-expandable-listView-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>15. JazzyListView ListView及GridView item以特殊动画效果进入屏幕，效果包括grow、cards、curl、wave、flip、fly等等</strong></p>
<p>项目地址：<a title="https://github.com/twotoasters/JazzyListView" href="https://github.com/twotoasters/JazzyListView" target="_blank">https://github.com/twotoasters/JazzyListView</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.twotoasters.jazzylistview.sample" href="https://play.google.com/store/apps/details?id=com.twotoasters.jazzylistview.sample" target="_blank">https://play.google.com/store/apps/details?id=com.twotoasters.jazzylistview.sample</a><br />
效果展示：<a title="http://lab.hakim.se/scroll-effects/" href="http://lab.hakim.se/scroll-effects/" target="_blank">http://lab.hakim.se/scroll-effects/</a></p>
<p>&nbsp;</p>
<p><strong>16. ListViewAnimations 带Item显示动画的ListView，动画包括底部飞入、其他方向斜飞入、下层飞入、渐变消失、滑动删除等</strong><br />
项目地址：<a title="https://github.com/nhaarman/ListViewAnimations" href="https://github.com/nhaarman/ListViewAnimations" target="_blank">https://github.com/nhaarman/ListViewAnimations</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.haarman.listviewanimations" href="https://play.google.com/store/apps/details?id=com.haarman.listviewanimations" target="_blank">https://play.google.com/store/apps/details?id=com.haarman.listviewanimations</a><br />
APP示例：Google plus、Google Now卡片式进入、小米系统中应用商店、联系人、游戏中心、音乐、文件管理器的ListView、Ultimate、Light Flow Lite、TreinVerkeer、Running Coach、Pearl Jam Lyrics、Calorie Chart、Car Hire、Super BART、DK FlashCards、Counter Plus、Voorlees Verhaaltjes 2.0</p>
<p>&nbsp;</p>
<p><strong>17. DevsmartLib-Android 横向ListView</strong><br />
项目地址：<a title="https://github.com/dinocore1/DevsmartLib-Android" href="https://github.com/dinocore1/DevsmartLib-Android" target="_blank">https://github.com/dinocore1/DevsmartLib-Android</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/horizontal-listview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/horizontal-listview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/horizontal-listview-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>二、ActionBar</strong></p>
<p><strong>1. ActionBarSherlock 为Android所有版本提供统一的ActionBar，解决4.0以下ActionBar的适配问题</strong><br />
项目地址：<a title="https://github.com/JakeWharton/ActionBarSherlock" href="https://github.com/JakeWharton/ActionBarSherlock" target="_blank">https://github.com/JakeWharton/ActionBarSherlock</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.actionbarsherlock.sample.demos" href="https://play.google.com/store/apps/details?id=com.actionbarsherlock.sample.demos" target="_blank">https://play.google.com/store/apps/details?id=com.actionbarsherlock.sample.demos</a><br />
APP示例：太多了。。现在连google都在用</p>
<p>&nbsp;</p>
<p><strong>2. ActionBar-PullToRefresh 下拉刷新，ActionBar出现加载中提示</strong><br />
项目地址：<a title="https://github.com/chrisbanes/ActionBar-PullToRefresh" href="https://github.com/chrisbanes/ActionBar-PullToRefresh" target="_blank">https://github.com/chrisbanes/ActionBar-PullToRefresh</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=uk.co.senab.actionbarpulltorefresh.samples.stock" href="https://play.google.com/store/apps/details?id=uk.co.senab.actionbarpulltorefresh.samples.stock" target="_blank">https://play.google.com/store/apps/details?id=uk.co.senab.actionbarpulltorefresh.samples.stock</a><br />
APP示例：Gmail，Google plus，知乎等</p>
<p>&nbsp;</p>
<p><strong>3. FadingActionBar ListView向下滚动逐渐显现的ActionBar</strong></p>
<p>项目地址：<a title="https://github.com/ManuelPeinado/FadingActionBar" href="https://github.com/ManuelPeinado/FadingActionBar" target="_blank">https://github.com/ManuelPeinado/FadingActionBar</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.manuelpeinado.fadingactionbar.demo" href="https://play.google.com/store/apps/details?id=com.manuelpeinado.fadingactionbar.demo" target="_blank">https://play.google.com/store/apps/details?id=com.manuelpeinado.fadingactionbar.demo</a><br />
APP示例：google music，知乎</p>
<p>&nbsp;</p>
<p><strong>4. NotBoringActionBar google music下拉收缩的ActionBar</strong><br />
项目地址：<a title="https://github.com/flavienlaurent/NotBoringActionBar" href="https://github.com/flavienlaurent/NotBoringActionBar" target="_blank">https://github.com/flavienlaurent/NotBoringActionBar</a><br />
Demo地址：<a title="http://flavienlaurent.com/blog/2013/11/20/making-your-action-bar-not-boring/" href="http://flavienlaurent.com/blog/2013/11/20/making-your-action-bar-not-boring/" target="_blank">http://flavienlaurent.com/blog/2013/11/20/making-your-action-bar-not-boring/</a><br />
APP示例：Google音乐</p>
<p>&nbsp;</p>
<p><strong>5. RefreshActionItem 带进度显示和刷新按钮的ActionBar</strong><br />
项目地址：<a title="https://github.com/ManuelPeinado/RefreshActionItem" href="https://github.com/ManuelPeinado/RefreshActionItem" target="_blank">https://github.com/ManuelPeinado/RefreshActionItem</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.manuelpeinado.refreshactionitem.demo" href="https://play.google.com/store/apps/details?id=com.manuelpeinado.refreshactionitem.demo" target="_blank">https://play.google.com/store/apps/details?id=com.manuelpeinado.refreshactionitem.demo</a><br />
APP示例：The New York Times，DevAppsDirect.</p>
<p>&nbsp;</p>
<p><strong>6. GlassActionBar 类似玻璃的有一定透明度的ActionBar</strong><br />
项目地址：<a title="https://github.com/ManuelPeinado/GlassActionBar" href="https://github.com/ManuelPeinado/GlassActionBar" target="_blank">https://github.com/ManuelPeinado/GlassActionBar</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.manuelpeinado.glassactionbardemo" href="https://play.google.com/store/apps/details?id=com.manuelpeinado.glassactionbardemo" target="_blank">https://play.google.com/store/apps/details?id=com.manuelpeinado.glassactionbardemo</a><br />
APP示例：google music</p>
<p>&nbsp;</p>
<p><strong>三、Menu </strong></p>
<p><strong>1. MenuDrawer 滑出式菜单</strong>，通过拖动屏幕边缘滑出菜单，支持屏幕上下左右划出，支持当前View处于上下层，支持Windows边缘、ListView边缘、ViewPager变化划出菜单等。<br />
项目地址：<a title="https://github.com/SimonVT/android-menudrawer" href="https://github.com/SimonVT/android-menudrawer" target="_blank">https://github.com/SimonVT/android-menudrawer</a><br />
Demo地址：<a title="http://simonvt.github.io/android-menudrawer/" href="http://simonvt.github.io/android-menudrawer/" target="_blank">http://simonvt.github.io/android-menudrawer/</a><br />
APP示例：Gmail、Google Music等大部分google app</p>
<p>&nbsp;</p>
<p><strong>2. SlidingMenu 滑出式菜单</strong>，通过拖动屏幕边缘滑出菜单，支持屏幕左右划出，支持菜单zoom、scale、slide up三种动画样式出现。<br />
项目地址：<a title="https://github.com/jfeinstein10/SlidingMenu" href="https://github.com/jfeinstein10/SlidingMenu" target="_blank">https://github.com/jfeinstein10/SlidingMenu</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.slidingmenu.example" href="https://play.google.com/store/apps/details?id=com.slidingmenu.example" target="_blank">https://play.google.com/store/apps/details?id=com.slidingmenu.example</a><br />
APP示例：Foursquare, LinkedIn, Zappos, Rdio, Evernote Food, Plume, VLC for Android, ESPN ScoreCenter, MLS MatchDay, 9GAG, Wunderlist 2, The Verge, MTG Familiar, Mantano Reader, Falcon Pro (BETA), MW3 Barracks<br />
MenuDrawer和SlidingMenu比较：SlidingMenu支持菜单动画样式出现，MenuDrawer支持菜单view处于内容的上下层</p>
<p>&nbsp;</p>
<p><strong>3. ArcMenu 支持类似Path的左下角动画旋转菜单及横向划出菜单、圆心弹出菜单</strong><br />
项目地址：<a title="https://github.com/daCapricorn/ArcMenu" href="https://github.com/daCapricorn/ArcMenu" target="_blank">https://github.com/daCapricorn/ArcMenu</a><br />
APP示例：Path<br />
效果图：(有墙)<a title="https://dl.dropboxusercontent.com/u/11369687/preview0.png" href="https://dl.dropboxusercontent.com/u/11369687/preview0.png" target="_blank">https://dl.dropboxusercontent.com/u/11369687/preview0.png</a><br />
<a title="https://dl.dropboxusercontent.com/u/11369687/preview1.png" href="https://dl.dropboxusercontent.com/u/11369687/preview1.png" target="_blank">https://dl.dropboxusercontent.com/u/11369687/preview1.png</a><br />
<a title="https://dl.dropboxusercontent.com/u/11369687/raymenu.png" href="https://dl.dropboxusercontent.com/u/11369687/raymenu.png" target="_blank">https://dl.dropboxusercontent.com/u/11369687/raymenu.png</a></p>
<p>&nbsp;</p>
<p><strong>4. android-satellite-menu 类似Path的左下角动画旋转菜单</strong></p>
<p>项目地址：<a title="https://github.com/siyamed/android-satellite-menu" href="https://github.com/siyamed/android-satellite-menu" target="_blank">https://github.com/siyamed/android-satellite-menu</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/satellite-menu-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/satellite-menu-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/satellite-menu-demo.apk?raw=true</a><br />
APP示例：Path</p>
<p>&nbsp;</p>
<p><strong>5. radial-menu-widget 圆形菜单，支持二级菜单</strong><br />
项目地址：<a title="https://code.google.com/p/radial-menu-widget/" href="https://code.google.com/p/radial-menu-widget/" target="_blank">https://code.google.com/p/radial-menu-widget/</a><br />
效果图：<a href="http://farm8.staticflickr.com/7377/11621125154_d1773c2dcc_o.jpg">http://farm8.staticflickr.com/7377/11621125154_d1773c2dcc_o.jpg</a></p>
<p>&nbsp;</p>
<p><strong>6. Android Wheel Menu 圆形旋转选取菜单</strong></p>
<p>项目地址：<a title="https://github.com/anupcowkur/Android-Wheel-Menu" href="https://github.com/anupcowkur/Android-Wheel-Menu" target="_blank">https://github.com/anupcowkur/Android-Wheel-Menu</a><br />
效果图：<a title="https://raw.github.com/anupcowkur/Android-Wheel-Menu/master/graphics/wheel.gif" href="https://raw.github.com/anupcowkur/Android-Wheel-Menu/master/graphics/wheel.gif" target="_blank">https://raw.github.com/anupcowkur/Android-Wheel-Menu/master/graphics/wheel.gif</a></p>
<p>&nbsp;</p>
<p><strong>7. FoldingNavigationDrawer滑动并以折叠方式打开菜单</strong><br />
项目地址：<a title="https://github.com/tibi1712/FoldingNavigationDrawer-Android" href="https://github.com/tibi1712/FoldingNavigationDrawer-Android" target="_blank">https://github.com/tibi1712/FoldingNavigationDrawer-Android</a><br />
使用介绍：<a title="https://play.google.com/store/apps/details?id=com.ptr.folding.sample" href="https://play.google.com/store/apps/details?id=com.ptr.folding.sample" target="_blank">https://play.google.com/store/apps/details?id=com.ptr.folding.sample</a><br />
效果图：<a title="https://lh6.ggpht.com/VnKUZenAozQ0KFAm5blFTGqMaKFjvX-BK2JH-jrX1sIXVTqciACqRhqFH48hc4pm2Q=h310-rw" href="https://lh6.ggpht.com/VnKUZenAozQ0KFAm5blFTGqMaKFjvX-BK2JH-jrX1sIXVTqciACqRhqFH48hc4pm2Q=h310-rw" target="_blank">https://lh6.ggpht.com/VnKUZenAozQ0KFAm5blFTGqMaKFjvX-BK2JH-jrX1sIXVTqciACqRhqFH48hc4pm2Q=h310-rw</a></p>
<p>&nbsp;</p>
<p><strong>四、ViewPager 、Gallery</strong></p>
<p><strong>1. Android-ViewPagerIndicator 配合ViewPager使用的Indicator，支持各种位置和样式</strong><br />
项目地址：<a title="https://github.com/JakeWharton/Android-ViewPagerIndicator" href="https://github.com/JakeWharton/Android-ViewPagerIndicator" target="_blank">https://github.com/JakeWharton/Android-ViewPagerIndicator</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.viewpagerindicator.sample" href="https://play.google.com/store/apps/details?id=com.viewpagerindicator.sample" target="_blank">https://play.google.com/store/apps/details?id=com.viewpagerindicator.sample</a><br />
APP示例：太多了。。</p>
<p>&nbsp;</p>
<p><strong>2. JazzyViewPager 支持Fragment切换动画的ViewPager，动画包括转盘、淡入淡出、翻页、层叠、旋转、方块、翻转、放大缩小等</strong><br />
项目地址：<a title="https://github.com/jfeinstein10/JazzyViewPager" href="https://github.com/jfeinstein10/JazzyViewPager" target="_blank">https://github.com/jfeinstein10/JazzyViewPager</a><br />
Demo地址：<a title="https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true" href="https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true" target="_blank">https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true</a><br />
效果图：类似桌面左右切换的各种效果，不过桌面并非用ViewPager实现而已</p>
<p>&nbsp;</p>
<p><strong>3. Android-DirectionalViewPager 支持横向和纵向(垂直)的ViewPager</strong></p>
<p>项目地址：<a title="https://github.com/JakeWharton/Android-DirectionalViewPager" href="https://github.com/JakeWharton/Android-DirectionalViewPager" target="_blank">https://github.com/JakeWharton/Android-DirectionalViewPager</a><br />
Demo地址：<a title="https://market.android.com/details?id=com.directionalviewpager.sample" href="https://market.android.com/details?id=com.directionalviewpager.sample" target="_blank">https://market.android.com/details?id=com.directionalviewpager.sample</a></p>
<p>&nbsp;</p>
<p><strong>4. android-pulltorefresh 支持下拉刷新的ViewPager</strong></p>
<p>项目地址：<a title="https://github.com/chrisbanes/Android-PullToRefresh" href="https://github.com/chrisbanes/Android-PullToRefresh" target="_blank">https://github.com/chrisbanes/Android-PullToRefresh</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/pull-to-refreshview-demo.apk?raw=true</a></p>
<p>APP示例：新浪微博各个页面</p>
<p>&nbsp;</p>
<p><strong>5. FancyCoverFlow支持Item切换动画效果的类似Gallery View</strong><br />
项目地址：<a title="https://github.com/davidschreiber/FancyCoverFlow" href="https://github.com/davidschreiber/FancyCoverFlow" target="_blank">https://github.com/davidschreiber/FancyCoverFlow</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=at.technikum.mti.fancycoverflow.samples" href="https://play.google.com/store/apps/details?id=at.technikum.mti.fancycoverflow.samples" target="_blank">https://play.google.com/store/apps/details?id=at.technikum.mti.fancycoverflow.samples</a><br />
效果图：<a title="https://github-camo.global.ssl.fastly.net/ef5ced52b7b54652b50499521ed797c0188c7a6b/687474703a2f2f64617669647363687265696265722e6769746875622e696f2f46616e6379436f766572466c6f772f73637265656e73686f74322e706e67" href="https://github-camo.global.ssl.fastly.net/ef5ced52b7b54652b50499521ed797c0188c7a6b/687474703a2f2f64617669647363687265696265722e6769746875622e696f2f46616e6379436f766572466c6f772f73637265656e73686f74322e706e67" target="_blank">https://github-camo.global.ssl.fastly.net/ef5ced52b7b54652b50499521ed797c0188c7a6b/687474703a2f2f64617669647363687265696265722e6769746875622e696f2f46616e6379436f766572466c6f772f73637265656e73686f74322e706e67</a></p>
<p>&nbsp;</p>
<p><strong>6. AndroidTouchGallery 支持双击或双指缩放的Gallery(用ViewPager实现)</strong><br />
相比下面的PhotoView，在被放大后依然能滑到下一个item，并且支持直接从url和文件中获取图片，<br />
项目地址：<a title="https://github.com/Dreddik/AndroidTouchGallery" href="https://github.com/Dreddik/AndroidTouchGallery" target="_blank">https://github.com/Dreddik/AndroidTouchGallery</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/touch-gallery-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/touch-gallery-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/touch-gallery-demo.apk?raw=true</a><br />
APP示例：类似微信中查看聊天记录图片时可双击放大，并且放大情况下能正常左右滑动到前后图片</p>
<p>&nbsp;</p>
<p><strong>7. Salvage view 带View缓存的Viewpager PagerAdapter，很方便使用</strong></p>
<p>项目地址：<a title="https://github.com/JakeWharton/salvage" href="https://github.com/JakeWharton/salvage" target="_blank">https://github.com/JakeWharton/salvage</a></p>
<p>&nbsp;</p>
<p><strong>五、GridView</strong></p>
<p><strong>1. StaggeredGridView 允许非对齐行的GridView</strong></p>
<p>类似Pinterest的瀑布流，并且跟ListView一样自带View缓存，继承自ViewGroup<br />
项目地址：<a title="https://github.com/maurycyw/StaggeredGridView" href="https://github.com/maurycyw/StaggeredGridView" target="_blank">https://github.com/maurycyw/StaggeredGridView</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/staggered-gridview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/staggered-gridview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/staggered-gridview-demo.apk?raw=true</a><br />
APP示例：Pinterest等</p>
<p>&nbsp;</p>
<p><strong>2. AndroidStaggeredGrid 允许非对齐行的GridView</strong></p>
<p>类似Pinterest的瀑布流，继承自AbsListView<br />
项目地址：<a title="https://github.com/etsy/AndroidStaggeredGrid" href="https://github.com/etsy/AndroidStaggeredGrid" target="_blank">https://github.com/etsy/AndroidStaggeredGrid</a></p>
<p>APP示例：Pinterest等</p>
<p>&nbsp;</p>
<p><strong>3. PinterestLikeAdapterView 允许非对齐行的GridView</strong></p>
<p>类似Pinterest的瀑布流，允许下拉刷新<br />
项目地址：<a title="https://github.com/huewu/PinterestLikeAdapterView" href="https://github.com/huewu/PinterestLikeAdapterView" target="_blank">https://github.com/huewu/PinterestLikeAdapterView</a></p>
<p>APP示例：Pinterest等</p>
<p>&nbsp;</p>
<p><strong>4. DraggableGridView Item可拖动交换位置的GridView，类似桌面的单屏效果</strong><br />
项目地址：<a title="https://github.com/thquinn/DraggableGridView" href="https://github.com/thquinn/DraggableGridView" target="_blank">https://github.com/thquinn/DraggableGridView</a><br />
Demo地址：<a title="https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true" href="https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true" target="_blank">https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>六、ImageView</strong></p>
<p><strong>1. PhotoView 支持双击或双指缩放的ImageView</strong></p>
<p>在ViewPager等Scrolling view中正常使用，相比上面的AndroidTouchGallery，不仅支持ViewPager，同时支持单个ImageView<br />
项目地址：<a title="https://github.com/chrisbanes/PhotoView" href="https://github.com/chrisbanes/PhotoView" target="_blank">https://github.com/chrisbanes/PhotoView</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=uk.co.senab.photoview.sample" href="https://play.google.com/store/apps/details?id=uk.co.senab.photoview.sample" target="_blank">https://play.google.com/store/apps/details?id=uk.co.senab.photoview.sample</a><br />
APP示例：<a title="https://play.google.com/store/apps/details?id=uk.co.senab.photup" href="https://play.google.com/store/apps/details?id=uk.co.senab.photup" target="_blank">photup</a></p>
<p>&nbsp;</p>
<p><strong>2. android-gif-drawable 支持fig显示的view</strong><br />
项目地址：<a title="https://github.com/koral--/android-gif-drawable" href="https://github.com/koral--/android-gif-drawable" target="_blank">https://github.com/koral&#8211;/android-gif-drawable</a></p>
<p>用jni实现的，编译生成so库后直接xml定义view即可，而且本身不依赖于其他开源项目，所以相对下面的ImageViewEx简单的多</p>
<p>&nbsp;</p>
<p><strong>3. ImageViewEx 支持Gif显示的ImageView</strong></p>
<p>项目地址：<a title="https://github.com/frapontillo/ImageViewEx" href="https://github.com/frapontillo/ImageViewEx" target="_blank">https://github.com/frapontillo/ImageViewEx</a>，<br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/imageviewex-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/imageviewex-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/imageviewex-demo.apk?raw=true</a></p>
<p>依赖很多，编译过程很繁琐!|_|!</p>
<p>&nbsp;</p>
<p><strong>4. RoundedImageView 带圆角的ImageView</strong></p>
<p>项目地址：<a title="https://github.com/vinc3m1/RoundedImageView" href="https://github.com/vinc3m1/RoundedImageView" target="_blank">https://github.com/vinc3m1/RoundedImageView</a><br />
效果图：<a title="https://raw.github.com/makeramen/RoundedImageView/master/screenshot.png" href="https://raw.github.com/makeramen/RoundedImageView/master/screenshot.png" target="_blank">https://raw.github.com/makeramen/RoundedImageView/master/screenshot.png</a></p>
<p>&nbsp;</p>
<p><strong>七、ProgressBar</strong></p>
<p><strong>1. SmoothProgressBar 水平进度条</strong></p>
<p>项目地址：<a title="https://github.com/castorflex/SmoothProgressBar" href="https://github.com/castorflex/SmoothProgressBar" target="_blank">https://github.com/castorflex/SmoothProgressBar</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=fr.castorflex.android.smoothprogressbar.sample" href="https://play.google.com/store/apps/details?id=fr.castorflex.android.smoothprogressbar.sample" target="_blank">https://play.google.com/store/apps/details?id=fr.castorflex.android.smoothprogressbar.sample</a></p>
<p>&nbsp;</p>
<p><strong>2. ProgressWheel 支持进度显示的圆形ProgressBar</strong><br />
项目地址：<a title="https://github.com/Todd-Davies/ProgressWheel" href="https://github.com/Todd-Davies/ProgressWheel" target="_blank">https://github.com/Todd-Davies/ProgressWheel</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/progress-wheel-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/progress-wheel-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/progress-wheel-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>3. android-square-progressbar 在图片周围显示进度</strong><br />
项目地址：<a title="https://github.com/mrwonderman/android-square-progressbar" href="https://github.com/mrwonderman/android-square-progressbar" target="_blank">https://github.com/mrwonderman/android-square-progressbar</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=net.yscs.android.square_progressbar_example" href="https://play.google.com/store/apps/details?id=net.yscs.android.square_progressbar_example" target="_blank">https://play.google.com/store/apps/details?id=net.yscs.android.square_progressbar_example</a><br />
APP示例：square<br />
效果图：<a title="https://googledrive.com/host/0BwESwPCuXtw7eExwSFVLQkR2TTg/newscreen1.png" href="https://googledrive.com/host/0BwESwPCuXtw7eExwSFVLQkR2TTg/newscreen1.png" target="_blank">https://googledrive.com/host/0BwESwPCuXtw7eExwSFVLQkR2TTg/newscreen1.png</a></p>
<p>&nbsp;</p>
<p><strong>4. HoloCircularProgressBar Android4.1 时钟App样式</strong><br />
项目地址：<a title="https://github.com/passsy/android-HoloCircularProgressBar" href="https://github.com/passsy/android-HoloCircularProgressBar" target="_blank">https://github.com/passsy/android-HoloCircularProgressBar</a><br />
APP示例：Android4.1时钟App<br />
效果图：<a title="https://raw.github.com/passsy/android-HoloCircularProgressBar/master/raw/screenshot1.png" href="https://raw.github.com/passsy/android-HoloCircularProgressBar/master/raw/screenshot1.png" target="_blank">https://raw.github.com/passsy/android-HoloCircularProgressBar/master/raw/screenshot1.png</a></p>
<p>&nbsp;</p>
<p><strong>八、其他</strong></p>
<p><strong>1. achartengine 强大的图标绘制工具</strong></p>
<p>支持折线图、面积图、散点图、时间图、柱状图、条图、饼图、气泡图、圆环图、范围（高至低）条形图、拨号图/表、立方线图及各种图的结合<br />
项目地址：<a title="https://code.google.com/p/achartengine/" href="https://code.google.com/p/achartengine/" target="_blank">https://code.google.com/p/achartengine/</a><br />
官方网站：<a title="http://www.achartengine.org/" href="http://www.achartengine.org/" target="_blank">http://www.achartengine.org/</a><br />
效果图：<a title="http://www.achartengine.org/dimages/average_temperature.png" href="http://www.achartengine.org/dimages/average_temperature.png" target="_blank">http://www.achartengine.org/dimages/average_temperature.png</a><br />
<a title="http://www.achartengine.org/dimages/sales_line_and_area_chart.png" href="http://www.achartengine.org/dimages/sales_line_and_area_chart.png" target="_blank">http://www.achartengine.org/dimages/sales_line_and_area_chart.png</a><br />
<a title="http://www.achartengine.org/dimages/temperature_range_chart.png" href="http://www.achartengine.org/dimages/temperature_range_chart.png" target="_blank">http://www.achartengine.org/dimages/temperature_range_chart.png</a><br />
<a title="http://www.achartengine.org/dimages/combined_chart.png" href="http://www.achartengine.org/dimages/combined_chart.png" target="_blank">http://www.achartengine.org/dimages/combined_chart.png</a><br />
<a title="http://www.achartengine.org/dimages/budget_chart.png" href="http://www.achartengine.org/dimages/budget_chart.png" target="_blank">http://www.achartengine.org/dimages/budget_chart.png</a></p>
<p>APP示例：Wordpress Android，Google Analytics</p>
<p>&nbsp;</p>
<p><strong>2. GraphView 绘制图表和曲线图的View</strong></p>
<p>可用于Android上的曲形图、柱状图、波浪图展示<br />
项目地址：<a title="https://github.com/jjoe64/GraphView" href="https://github.com/jjoe64/GraphView" target="_blank">https://github.com/jjoe64/GraphView</a><br />
Demo工程：<a title="https://github.com/jjoe64/GraphView-Demos" href="https://github.com/jjoe64/GraphView-Demos" target="_blank">https://github.com/jjoe64/GraphView-Demos</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.sothree.umano" href="https://play.google.com/store/apps/details?id=com.sothree.umano" target="_blank">https://play.google.com/store/apps/details?id=com.sothree.umano</a><br />
APP示例：Wordpress Android，Google Analytics</p>
<p>&nbsp;</p>
<p><strong>3. android-flip 类似Flipboard翻转动画的实现</strong><br />
项目地址：<a title="https://github.com/openaphid/android-flip" href="https://github.com/openaphid/android-flip" target="_blank">https://github.com/openaphid/android-flip</a><br />
Demo地址：<a title="https://github.com/openaphid/android-flip/blob/master/FlipView/Demo/APK/Aphid-FlipView-Demo.apk?raw=true" href="https://github.com/openaphid/android-flip/blob/master/FlipView/Demo/APK/Aphid-FlipView-Demo.apk?raw=true" target="_blank">https://github.com/openaphid/android-flip/blob/master/FlipView/Demo/APK/Aphid-FlipView-Demo.apk?raw=true</a></p>
<p>APP示例：<a title="https://play.google.com/store/apps/details?id=flipboard.app" href="https://play.google.com/store/apps/details?id=flipboard.app" target="_blank">flipboard</a></p>
<p>&nbsp;</p>
<p><strong>4. FlipImageView 支持x、y、z及动画选择的翻转动画的实现</strong><br />
项目地址：<a title="https://github.com/castorflex/FlipImageView" href="https://github.com/castorflex/FlipImageView" target="_blank">https://github.com/castorflex/FlipImageView</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=fr.castorflex.android.flipimageview" href="https://play.google.com/store/apps/details?id=fr.castorflex.android.flipimageview" target="_blank">https://play.google.com/store/apps/details?id=fr.castorflex.android.flipimageview</a></p>
<p>&nbsp;</p>
<p><strong>5. SwipeBackLayout 左右或向上滑动返回的Activity</strong></p>
<p>项目地址：<a title="https://github.com/Issacw0ng/SwipeBackLayout" href="https://github.com/Issacw0ng/SwipeBackLayout" target="_blank">https://github.com/Issacw0ng/SwipeBackLayout</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=me.imid.swipebacklayout.demo" href="https://play.google.com/store/apps/details?id=me.imid.swipebacklayout.demo" target="_blank">https://play.google.com/store/apps/details?id=me.imid.swipebacklayout.demo</a><br />
APP示例：知乎</p>
<p>&nbsp;</p>
<p><strong>6. Cards-UI 卡片式View，支持单个卡片，item为卡片的ListView</strong><br />
项目地址：<a title="https://github.com/afollestad/Cards-UI" href="https://github.com/afollestad/Cards-UI" target="_blank">https://github.com/afollestad/Cards-UI</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/cards-ui-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/cards-ui-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/cards-ui-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>7. cardslib 卡片式View，支持单个卡片，item为卡片的ListView和GridView</strong><br />
项目地址：<a title="https://github.com/gabrielemariotti/cardslib" href="https://github.com/gabrielemariotti/cardslib" target="_blank">https://github.com/gabrielemariotti/cardslib</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=it.gmariotti.cardslib.demo" href="https://play.google.com/store/apps/details?id=it.gmariotti.cardslib.demo" target="_blank">https://play.google.com/store/apps/details?id=it.gmariotti.cardslib.demo</a></p>
<p>&nbsp;</p>
<p><strong>8. android-styled-dialogs 可自定义样式的dialog</strong></p>
<p>默认与Holo主题样式一致，在Android2.2以上同一样式<br />
项目地址：<a title="https://github.com/inmite/android-styled-dialogs" href="https://github.com/inmite/android-styled-dialogs" target="_blank">https://github.com/inmite/android-styled-dialogs</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/styled-dialogs-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/styled-dialogs-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/styled-dialogs-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>9. Crouton 丰富样式的Toast</strong></p>
<p>允许alert、comfirm、info样式及点击消失样式，允许设置Toast显示时间，允许自定义View。<br />
项目地址：<a title="https://github.com/keyboardsurfer/Crouton" href="https://github.com/keyboardsurfer/Crouton" target="_blank">https://github.com/keyboardsurfer/Crouton</a><br />
Demo地址：<a title="http://play.google.com/store/apps/details?id=de.keyboardsurfer.app.demo.crouton" href="http://play.google.com/store/apps/details?id=de.keyboardsurfer.app.demo.crouton" target="_blank">http://play.google.com/store/apps/details?id=de.keyboardsurfer.app.demo.crouton</a></p>
<p>&nbsp;</p>
<p><strong>10. supertooltips 带动画效果的Tips显示</strong><br />
项目地址：<a title="https://github.com/nhaarman/supertooltips" href="https://github.com/nhaarman/supertooltips" target="_blank">https://github.com/nhaarman/supertooltips</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.haarman.supertooltips" href="https://play.google.com/store/apps/details?id=com.haarman.supertooltips" target="_blank">https://play.google.com/store/apps/details?id=com.haarman.supertooltips</a></p>
<p>&nbsp;</p>
<p><strong>11. Android ViewBadger为其他View添加角标等</strong><br />
项目地址：<a title="https://github.com/jgilfelt/android-viewbadger" href="https://github.com/jgilfelt/android-viewbadger" target="_blank">https://github.com/jgilfelt/android-viewbadger</a></p>
<p>Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/android-viewbadger.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/android-viewbadger.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/android-viewbadger.apk?raw=true</a><br />
效果图：<a title="https://github-camo.global.ssl.fastly.net/a705a3e88c75ae2394943bd7c56f725697616ea8/687474703a2f2f7777772e6a65666667696c66656c742e636f6d2f766965776261646765722f76622d31612e706e67" href="https://github-camo.global.ssl.fastly.net/a705a3e88c75ae2394943bd7c56f725697616ea8/687474703a2f2f7777772e6a65666667696c66656c742e636f6d2f766965776261646765722f76622d31612e706e67" target="_blank">https://github-camo.global.ssl.fastly.net/a705a3e88c75ae2394943bd7c56f725697616ea8/687474703a2f2f7777772e6a65666667696c66656c742e636f6d2f766965776261646765722f76622d31612e706e67</a></p>
<p>&nbsp;</p>
<p><strong>12. Android Sliding Up Panel 可拖动的View，能在当前Activity上扶起一个可拖动的Panel</strong></p>
<p>项目地址：<a title="https://github.com/umano/AndroidSlidingUpPanel" href="https://github.com/umano/AndroidSlidingUpPanel" target="_blank">https://github.com/umano/AndroidSlidingUpPanel</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.sothree.umano" href="https://play.google.com/store/apps/details?id=com.sothree.umano" target="_blank">https://play.google.com/store/apps/details?id=com.sothree.umano</a><br />
APP示例：Google Music精简播放栏</p>
<p>&nbsp;</p>
<p><strong>13. android-times-square Android日历部件</strong></p>
<p>支持选取单个日期，多个日期，及日期区间段和对话框形式显示<br />
项目地址：<a title="https://github.com/square/android-times-square" href="https://github.com/square/android-times-square" target="_blank">https://github.com/square/android-times-square</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/times-square-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/times-square-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/times-square-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>14. android-calendar-card 日历</strong><br />
项目地址：<a title="https://github.com/kenumir/android-calendar-card" href="https://github.com/kenumir/android-calendar-card" target="_blank">https://github.com/kenumir/android-calendar-card</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.wt.calendarcardsample" href="https://play.google.com/store/apps/details?id=com.wt.calendarcardsample" target="_blank">https://play.google.com/store/apps/details?id=com.wt.calendarcardsample</a><br />
效果图：<a title="https://raw.github.com/kenumir/android-calendar-card/master/calendar-card-sample/_work/device-2013-10-12-151801.png" href="https://raw.github.com/kenumir/android-calendar-card/master/calendar-card-sample/_work/device-2013-10-12-151801.png" target="_blank">https://raw.github.com/kenumir/android-calendar-card/master/calendar-card-sample/_work/device-2013-10-12-151801.png</a></p>
<p>&nbsp;</p>
<p><strong>15. ColorPickerView 颜色选择器，支持PopupWindows或新的Activity中打开</strong></p>
<p>项目地址：<a title="https://code.google.com/p/color-picker-view/" href="https://code.google.com/p/color-picker-view/" target="_blank">https://code.google.com/p/color-picker-view/</a><br />
效果图：<a title="http://oi41.tinypic.com/33c6mm8.jpg" href="http://oi41.tinypic.com/33c6mm8.jpg" target="_blank">http://oi41.tinypic.com/33c6mm8.jpg</a></p>
<p>&nbsp;</p>
<p><strong>16. HoloColorPicker 颜色选择器</strong><br />
项目地址：<a title="https://github.com/LarsWerkman/HoloColorPicker" href="https://github.com/LarsWerkman/HoloColorPicker" target="_blank">https://github.com/LarsWerkman/HoloColorPicker</a><br />
Demo地址：<a title="https://docs.google.com/file/d/0BwclyDTlLrdXRzVnTGJvTlRfU2s/edit" href="https://docs.google.com/file/d/0BwclyDTlLrdXRzVnTGJvTlRfU2s/edit" target="_blank">https://docs.google.com/file/d/0BwclyDTlLrdXRzVnTGJvTlRfU2s/edit</a></p>
<p>&nbsp;</p>
<p><strong>17. AndroidWheel Android Wheel支持城市、多种日期时间、密码、图片</strong><br />
项目地址：<a title="https://github.com/sephiroth74/AndroidWheel" href="https://github.com/sephiroth74/AndroidWheel" target="_blank">https://github.com/sephiroth74/AndroidWheel</a><br />
效果图：<a href="http://farm6.staticflickr.com/5532/11621528786_220c040ba5_o.jpg">http://farm6.staticflickr.com/5532/11621528786_220c040ba5_o.jpg</a></p>
<p>&nbsp;</p>
<p><strong>18. android-flowtextview文字自动环绕其他View的Layout</strong><br />
项目地址：<a title="https://code.google.com/p/android-flowtextview/" href="https://code.google.com/p/android-flowtextview/" target="_blank">https://code.google.com/p/android-flowtextview/</a><br />
效果图：<a title="http://i949.photobucket.com/albums/ad332/vostroman1500/1.png" href="http://i949.photobucket.com/albums/ad332/vostroman1500/1.png" target="_blank">http://i949.photobucket.com/albums/ad332/vostroman1500/1.png</a></p>
<p>&nbsp;</p>
<p><strong>19. Segmented Radio Buttons for Android iOS&#8217;s segmented controls的实现</strong><br />
项目地址：<a title="https://github.com/vinc3m1/android-segmentedradiobutton" href="https://github.com/vinc3m1/android-segmentedradiobutton" target="_blank">https://github.com/vinc3m1/android-segmentedradiobutton</a><br />
Demo地址：<a title="https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true" href="https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true" target="_blank">https://github.com/thquinn/DraggableGridView/blob/master/bin/DraggableGridViewSample.apk?raw=true</a><br />
效果图：<a title="https://raw.github.com/vinc3m1/android-segmentedradiobutton/master/screens/segmentedradio.png" href="https://raw.github.com/vinc3m1/android-segmentedradiobutton/master/screens/segmentedradio.png" target="_blank">https://raw.github.com/vinc3m1/android-segmentedradiobutton/master/screens/segmentedradio.png</a></p>
<p>&nbsp;</p>
<p><strong>20. TableFixHeaders 第一列固定的Table</strong><br />
项目地址：<a title="https://github.com/InQBarna/TableFixHeaders" href="https://github.com/InQBarna/TableFixHeaders" target="_blank">https://github.com/InQBarna/TableFixHeaders</a><br />
Demo地址：<a title="http://bit.ly/13buAIq" href="http://bit.ly/13buAIq" target="_blank">http://bit.ly/13buAIq</a></p>
<p>&nbsp;</p>
<p><strong>21. Android Form EditText 验证输入合法性的编辑框</strong></p>
<p>支持输入、英文、ip、url等多种正则验证<br />
项目地址：<a title="https://github.com/vekexasia/android-edittext-validator" href="https://github.com/vekexasia/android-edittext-validator" target="_blank">https://github.com/vekexasia/android-edittext-validator</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.andreabaccega.edittextformexample" href="https://play.google.com/store/apps/details?id=com.andreabaccega.edittextformexample" target="_blank">https://play.google.com/store/apps/details?id=com.andreabaccega.edittextformexample</a></p>
<p>&nbsp;</p>
<p><strong>22. UITableView ios风格控件</strong></p>
<p>包括Button、ListView、TableView<br />
项目地址：<a title="https://github.com/thiagolocatelli/android-uitableview" href="https://github.com/thiagolocatelli/android-uitableview" target="_blank">https://github.com/thiagolocatelli/android-uitableview</a><br />
Demo地址：<a title="https://github.com/Trinea/TrineaDownload/blob/master/ui-tableview-demo.apk?raw=true" href="https://github.com/Trinea/TrineaDownload/blob/master/ui-tableview-demo.apk?raw=true" target="_blank">https://github.com/Trinea/TrineaDownload/blob/master/ui-tableview-demo.apk?raw=true</a></p>
<p>&nbsp;</p>
<p><strong>23. ATableView ios风格控件</strong><br />
项目地址：<a title="https://github.com/dmacosta/ATableView" href="https://github.com/dmacosta/ATableView" target="_blank">https://github.com/dmacosta/ATableView</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=com.nakardo.atableview.demo" href="https://play.google.com/store/apps/details?id=com.nakardo.atableview.demo" target="_blank">https://play.google.com/store/apps/details?id=com.nakardo.atableview.demo</a></p>
<p>&nbsp;</p>
<p><strong>24. UndoBar屏幕底部显示取消或是确认的PopupWindows</strong><br />
项目地址：<a title="https://github.com/soarcn/UndoBar" href="https://github.com/soarcn/UndoBar" target="_blank">https://github.com/soarcn/UndoBar</a><br />
效果图：<a title="https://github.com/soarcn/UndoBar/blob/master/art/redo.png?raw=true" href="https://github.com/soarcn/UndoBar/blob/master/art/redo.png?raw=true" target="_blank">https://github.com/soarcn/UndoBar/blob/master/art/redo.png?raw=true</a></p>
<p>&nbsp;</p>
<p>25. <strong>Inscription可用于展示应用change和new feature信息</strong><br />
项目地址：<a title="https://github.com/MartinvanZ/Inscription" href="https://github.com/MartinvanZ/Inscription" target="_blank">https://github.com/MartinvanZ/Inscription</a></p>
<p>&nbsp;</p>
<p><strong>26. ActivityTransition Activity切换动画，包括渐变、flip、某个位置进入等等</strong><br />
项目地址：<a title="https://github.com/ophilbert/ActivityTransition" href="https://github.com/ophilbert/ActivityTransition" target="_blank">https://github.com/ophilbert/ActivityTransition</a><br />
使用介绍：<a title="https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true" href="https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true" target="_blank">https://github.com/jfeinstein10/JazzyViewPager/blob/master/JazzyViewPager.apk?raw=true</a><br />
效果图：类似桌面左右切换的各种效果，不过桌面并非用ViewPager实现而已</p>
<p>&nbsp;</p>
<p><strong>27. Cropper 图片局部剪切工具，可触摸控制选择区域或旋转</strong><br />
项目地址：<a title="https://github.com/edmodo/cropper" href="https://github.com/edmodo/cropper" target="_blank">https://github.com/edmodo/cropper</a><br />
使用介绍：<a title="https://github.com/edmodo/cropper/wiki" href="https://github.com/edmodo/cropper/wiki" target="_blank">https://github.com/edmodo/cropper/wiki</a><br />
效果图：<a title="https://github-camo.global.ssl.fastly.net/e4fde77bf41d4a60b234b4e268e5cfa8c17d9b6f/687474703a2f2f692e696d6775722e636f6d2f334668735467666c2e6a7067" href="https://github-camo.global.ssl.fastly.net/e4fde77bf41d4a60b234b4e268e5cfa8c17d9b6f/687474703a2f2f692e696d6775722e636f6d2f334668735467666c2e6a7067" target="_blank">https://github-camo.global.ssl.fastly.net/e4fde77bf41d4a60b234b4e268e5cfa8c17d9b6f/687474703a2f2f692e696d6775722e636f6d2f334668735467666c2e6a7067</a></p>
<p>&nbsp;</p>
<p><strong>28. GlowPadBackport将Android4.2的锁屏界面解锁扩展到Android1.6及1.6+</strong><br />
项目地址：<a title="https://github.com/rock3r/GlowPadBackport" href="https://github.com/rock3r/GlowPadBackport" target="_blank">https://github.com/rock3r/GlowPadBackport</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=net.sebastianopoggi.samples.ui.GlowPadSample" href="https://play.google.com/store/apps/details?id=net.sebastianopoggi.samples.ui.GlowPadSample" target="_blank">https://play.google.com/store/apps/details?id=net.sebastianopoggi.samples.ui.GlowPadSample</a><br />
效果图：<a title="https://lh6.ggpht.com/U070b6Lh6cVsVwx4jN-5nq0xqiB1PBzrYABPeJIEe2hZQ5UWOxc-FDUG77wADelToHA=h310-rw" href="https://lh6.ggpht.com/U070b6Lh6cVsVwx4jN-5nq0xqiB1PBzrYABPeJIEe2hZQ5UWOxc-FDUG77wADelToHA=h310-rw" target="_blank">https://lh6.ggpht.com/U070b6Lh6cVsVwx4jN-5nq0xqiB1PBzrYABPeJIEe2hZQ5UWOxc-FDUG77wADelToHA=h310-rw</a></p>
<p>&nbsp;</p>
<p><strong>29. GlowPadView Android4锁屏界面解锁</strong><br />
项目地址：<a title="https://github.com/nadavfima/GlowPadView" href="https://github.com/nadavfima/GlowPadView" target="_blank">https://github.com/nadavfima/GlowPadView</a><br />
效果图：<a title="https://raw.github.com/nadavfima/GlowPadView/master/example.png" href="https://raw.github.com/nadavfima/GlowPadView/master/example.png" target="_blank">https://raw.github.com/nadavfima/GlowPadView/master/example.png</a></p>
<p>&nbsp;</p>
<p><strong>30. android-lockpattern Android的图案密码解锁</strong><br />
项目地址：<a title="https://code.google.com/p/android-lockpattern/" href="https://code.google.com/p/android-lockpattern/" target="_blank">https://code.google.com/p/android-lockpattern/</a><br />
Demo地址：<a title="https://play.google.com/store/apps/details?id=group.pals.android.lib.ui.lockpattern.demo" href="https://play.google.com/store/apps/details?id=group.pals.android.lib.ui.lockpattern.demo" target="_blank">https://play.google.com/store/apps/details?id=group.pals.android.lib.ui.lockpattern.demo</a><br />
使用介绍：<a title="https://code.google.com/p/android-lockpattern/wiki/QuickUse" href="https://code.google.com/p/android-lockpattern/wiki/QuickUse" target="_blank">https://code.google.com/p/android-lockpattern/wiki/QuickUse</a><br />
示例APP：Android开机的图案密码解锁，支付宝的密码解锁</p>







<%@include file="/footer.jsp"%>