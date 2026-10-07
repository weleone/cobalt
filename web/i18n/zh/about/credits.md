<script lang="ts">
    import { contacts, docs, partners } from "$lib/env";
    import { t } from "$lib/i18n/translations";

    import SectionHeading from "$components/misc/SectionHeading.svelte";
    import BetaTesters from "$components/misc/BetaTesters.svelte";
</script>

<section id="imput">
<SectionHeading
    title="imput"
    sectionId="imput"
/>

cobalt 是 [imput](https://imput.net/) 用爱和用心做出来的 ❤️

我们是个只有两个人的小团队，但一直在努力做出对大家有益的好软件。
如果你喜欢我们的工作，欢迎去[捐赠页](/donate)支持一下！
</section>

<section id="testers">
<SectionHeading
    title={$t("about.heading.testers")}
    sectionId="testers"
/>

大力感谢我们的测试人员，提前测试更新、保证稳定。
他们还帮我们发布了 cobalt 10！
<BetaTesters />

所有链接都是外部链接，指向他们的个人网站或社交媒体。
</section>

<section id="partners">
<SectionHeading
    title={$t("about.heading.partners")}
    sectionId="partners"
/>

cobalt 部分处理基础设施由我们的长期合作伙伴
[royalehosting.net]({partners.royalehosting}) 提供！
</section>

<section id="meowbalt">
<SectionHeading
    title={$t("general.meowbalt")}
    sectionId="meowbalt"
/>

meowbalt 是 cobalt 的闪电吉祥物，一只表情丰富的猫，热爱高速网络。

你在 cobalt 里看到的所有超棒的 meowbalt 画作
都出自 [GlitchyPSI](https://glitchypsi.xyz/) 之手。
他也是这个角色的原创作者。

imput 拥有 meowbalt 角色设计的法定权利，
但 GlitchyPSI 创作的具体画作不归我们。

我们爱 meowbalt，所以得立几条规矩保护他：
- 不能以非同人形式使用 meowbalt 的角色设计。
- 不能商用 meowbalt 的设计或画作。
- 不能在你自己的项目里用 meowbalt 的设计或画作。
- 不能以任何形式使用或修改 GlitchyPSI 的 meowbalt 画作。

如果你画了 meowbalt 的同人图，欢迎分享到
[我们的 discord 服务器](/about/community)，我们很想看！
</section>

<section id="licenses">
<SectionHeading
    title={$t("about.heading.licenses")}
    sectionId="licenses"
/>

cobalt api（处理服务器）代码开源，许可证为 [AGPL-3.0]({docs.apiLicense})。

cobalt 前端代码为 [source first](https://sourcefirst.com/)，许可证为 [CC-BY-NC-SA 4.0]({docs.webLicense})。

前端之所以 source first，是为了阻止骗子拿我们的成果牟利、
以及做恶意克隆来骗人、损害我们的公众形象。
除了商用，其他方面它和很多开源许可证遵循同样的原则。

我们依赖很多开源库，也自己造轮子并分发。
完整依赖列表可以在 [github]({contacts.github}) 上看到！
</section>
