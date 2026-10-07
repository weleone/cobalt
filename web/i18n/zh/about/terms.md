<script lang="ts">
    import { t } from "$lib/i18n/translations";
    import SectionHeading from "$components/misc/SectionHeading.svelte";
</script>

<section id="general">
<SectionHeading
    title={$t("about.heading.general")}
    sectionId="general"
/>

这些条款仅适用于官方 cobalt 实例。
其他情况，你可能需要联系实例搭建者获取准确信息。
</section>

<section id="saving">
<SectionHeading
    title={$t("about.heading.saving")}
    sectionId="saving"
/>

保存功能让从网上下载内容变得简单，
而保存下来的内容被拿去做什么，我们一概不负责。

处理服务器就像高级代理，永远不会把请求的内容写到磁盘上。
一切都在内存里处理，隧道完成后永久清除。
我们没有下载日志，也认不出任何人。

可以在[隐私政策](/about/privacy)里了解隧道的工作原理。
</section>

<section id="responsibility">
<SectionHeading
    title={$t("about.heading.responsibility")}
    sectionId="responsibility"
/>

你（最终用户）要为自己用我们工具做了什么、怎么用和分发产出内容负责。
用别人的内容时请多留心，记得给原作者署名。
确保不违反任何条款或许可证。

用于教育目的时，记得引用来源、给原作者署名。

合理使用和署名对大家都好。
</section>

<section id="abuse">
<SectionHeading
    title={$t("about.heading.abuse")}
    sectionId="abuse"
/>

因为 cobalt 完全匿名，我们没法自动发现滥用行为。
不过你可以通过邮件向我们举报，我们会尽力手动处理：abuse[at]imput.net

**这个邮箱不是用户支持邮箱，与滥用无关的问题不会得到回复。**

如果遇到使用问题，可以在[社区页](/about/community)上用你喜欢的方式联系我们求助。
</section>
