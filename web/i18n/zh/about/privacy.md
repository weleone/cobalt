<script lang="ts">
    import env from "$lib/env";
    import { t } from "$lib/i18n/translations";

    import SectionHeading from "$components/misc/SectionHeading.svelte";
</script>

<section id="general">
<SectionHeading
    title={$t("about.heading.general")}
    sectionId="general"
/>

cobalt 的隐私政策很简单：我们不收集、不存储关于你的任何东西。
你做什么完全是你自己的事，与我们或任何其他人无关。

这些条款仅适用于官方 cobalt 实例。
其他情况，你可能需要联系实例搭建者获取准确信息。
</section>

<section id="local">
<SectionHeading
    title={$t("about.heading.local")}
    sectionId="local"
/>

使用本机处理的工具离线、在本地运行，
处理过的数据不会发往任何地方。
凡是这类工具，都会明确标注。
</section>

<section id="saving">
<SectionHeading
    title={$t("about.heading.saving")}
    sectionId="saving"
/>

使用保存功能时，cobalt 可能需要代理或重新封装/转码文件。
这种情况下会创建一个临时隧道，
并把媒体的最少必要信息保存 90 秒。

在未修改的官方 cobalt 实例上，
**所有隧道数据都用只有最终用户能拿到的密钥加密**。

加密的隧道数据可能包括：
- 来源服务的名称。
- 媒体文件的原始 URL。
- 区分处理类型所需的内部参数。
- 最少的文件元数据（生成的文件名、标题、作者、创作年份、版权信息）。
- 隧道传输中 URL 出错时可能用到的原始请求的最少信息。

这些数据会在 90 秒后从服务器内存中不可逆地清除。
只要 cobalt 的源代码没被改过，没人能接触到缓存的隧道数据，连实例所有者也不行。

隧道里的媒体数据永远不会被存储/缓存到任何地方。
一切都是实时处理的，重新封装和转码也一样。
cobalt 的隧道就像一个匿名代理。

如果你的设备支持本地处理，
那加密隧道信息里包含的东西会少得多，因为它是直接返回给客户端的。

想了解工作原理，可以看 [github 上的相关源码](https://github.com/imputnet/cobalt/tree/main/api/src/stream)。
</section>

<section id="encryption">
<SectionHeading
    title={$t("about.heading.encryption")}
    sectionId="encryption"
/>

临时存储的隧道数据用 AES-256 标准加密。
解密密钥只包含在访问链接里，永远不会被记录/缓存/存储到任何地方。
只有最终用户能拿到链接和加密密钥。
每个请求的隧道都会生成唯一的密钥。
</section>

{#if env.PLAUSIBLE_ENABLED}
<section id="plausible">
<SectionHeading
    title={$t("about.heading.plausible")}
    sectionId="plausible"
/>

我们用 [plausible](https://plausible.io/) 来估算 cobalt 的大概活跃用户数，
全程匿名。关于你或你的请求的任何可识别信息都不会被存储。
所有数据都是匿名且聚合的。
我们自建并管理 cobalt 用的 [plausible 实例](https://{env.PLAUSIBLE_HOST}/)。

plausible 不用 cookie，完全符合 GDPR、CCPA 和 PECR。

如果你想退出匿名统计，可以在[隐私设置](/settings/privacy#analytics)里关掉。
关掉后 plausible 脚本根本不会被加载。

[了解 plausible 在隐私上的坚持](https://plausible.io/privacy-focused-web-analytics)。
</section>
{/if}

<section id="cloudflare">
<SectionHeading
    title={$t("about.heading.cloudflare")}
    sectionId="cloudflare"
/>

我们在以下方面用 cloudflare 的服务：
- ddos 和滥用防护。
- 机器人防护（cloudflare turnstile）。
- 静态网页应用的托管与部署（cloudflare workers）。

这些都是为了给每个人最好的体验，缺一不可。
在我们所知范围内，cloudflare 是上述方案里最注重隐私、最可靠的提供商。

cloudflare 完全符合 GDPR 和 HIPAA。

[了解 cloudflare 在隐私上的坚持](https://www.cloudflare.com/trust-hub/privacy-and-data-protection/)。
</section>
