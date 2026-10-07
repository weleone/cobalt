<script lang="ts">
    import { t } from "$lib/i18n/translations";
    import { contacts, docs } from "$lib/env";

    import SectionHeading from "$components/misc/SectionHeading.svelte";
</script>

<section id="summary">
<SectionHeading
    title={$t("about.heading.summary")}
    sectionId="summary"
/>

cobalt 帮你从喜欢的网站保存任何东西：视频、音频、照片或动图。粘贴链接，就可以开摇了！

没有广告、追踪、付费墙和其他破事。就是一个方便的网页应用，随时随地能用。
</section>

<section id="motivation">
<SectionHeading
    title={$t("about.heading.motivation")}
    sectionId="motivation"
/>

cobalt 为公益而生，保护人们不受那些山寨下载器推送的广告和恶意软件之害。
我们相信最好的软件是安全、开放、无障碍的。所有 imput 项目都遵循这些基本原则。
</section>

<section id="privacy-efficiency">
<SectionHeading
    title={$t("about.heading.privacy_efficiency")}
    sectionId="privacy-efficiency"
/>

所有发往后端的请求都是匿名的，所有潜在文件隧道的信息都是加密的。
我们有严格的零日志政策，不存储、不追踪*任何*关于个人的东西。

如果请求需要额外处理，比如重新封装或转码，cobalt 会直接在你的设备上处理媒体。
这样效率最高、隐私最好。

如果你的设备不支持本地处理，那就用服务器实时处理代替。
这种情况下，处理好的媒体直接串流给客户端，永远不会写到服务器磁盘上。

你可以[开启强制隧道](/settings/privacy#tunnel)把隐私再拉满。
打开后，cobalt 会给所有下载的文件走隧道，而不只是必须走的那些。
没人会知道你从哪下载了东西，连你的网络运营商都不知道。
他们只能看到你在用某个 cobalt 实例。
</section>

<section id="community">
<SectionHeading
    title={$t("about.heading.community")}
    sectionId="community"
/>

无数艺术家、教育者和创作者用 cobalt 做热爱的事。
我们一直和社区保持联系，一起把 cobalt 做得更好用。
欢迎[加入我们](/about/community)！

我们相信互联网的未来是开放的，所以 cobalt 是
[source first](https://sourcefirst.com/)，而且[很容易自己搭]({docs.instanceHosting})。

如果你朋友搭了处理实例，问他要个域名，[在实例设置里加上](/settings/instances#community)就行。

你可以随时[在 github 上]({contacts.github})看源代码、提贡献。
欢迎一切贡献和建议！
</section>
