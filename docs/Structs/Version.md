# Version
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">struct</span> <span class="kt">Version</span><span class="p">:</span> <span class="kt">CustomStringConvertible</span></code></pre>

<p>Complete Version Information.</p>

### semver
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">semver</span><span class="p">:</span> <span class="kt"><a href="../Structs/SemVer.md">SemVer</a></span></code></pre>

<p>Semantic Version.</p>

### build
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">build</span><span class="p">:</span> <span class="kt">Int</span></code></pre>

<p>Build Number.</p>

### versionControl
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">versionControl</span><span class="p">:</span> <span class="kt"><a href="../Structs/VersionControlInfo.md">VersionControlInfo</a></span><span class="p">?</span></code></pre>

<p>Autorevision Version Control Info.</p>

### dictionary
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">dictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span></code></pre>

<p>Semantic Version, Build Number, and Stage Dictionary.</p>

### init(semver:build:dictionary:versionControlInfo:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span><span class="nv">semver</span><span class="p">:</span> <span class="kt"><a href="../Structs/SemVer.md">SemVer</a></span><span class="p">,</span> <span class="nv">build</span><span class="p">:</span> <span class="kt">Int</span><span class="p">,</span>
              <span class="nv">dictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span><span class="p">,</span>
              <span class="nv">versionControlInfo</span><span class="p">:</span> <span class="kt"><a href="../Structs/VersionControlInfo.md">VersionControlInfo</a></span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span><span class="p">)</span></code></pre>

<p>Create a Version based on a <strong>SemVer</strong>, Build Number, <strong>StageBuildDictionaryProtocol</strong>,
and an optional <strong>VersionControlInfo</strong>.</p>

### init(cumulativeBuildNumber:dictionary:versionControlInfo:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span>
    <span class="nv">cumulativeBuildNumber</span><span class="p">:</span> <span class="kt">Int</span><span class="p">,</span>
    <span class="nv">dictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span><span class="p">,</span>
    <span class="nv">versionControlInfo</span><span class="p">:</span> <span class="kt"><a href="../Structs/VersionControlInfo.md">VersionControlInfo</a></span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span><span class="p">)</span></code></pre>

<p>Create a Version based on a Cumulative Build Number, <strong>StageBuildDictionaryProtocol</strong>,
and an optional <strong>VersionControlInfo</strong>.</p>

### init(bundle:dictionary:versionControl:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span>
    <span class="nv">bundle</span><span class="p">:</span> <span class="kt"><a href="../Protocols/InfoDictionaryContainerProtocol.md">InfoDictionaryContainerProtocol</a></span><span class="p">,</span>
    <span class="nv">dictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span><span class="p">,</span>
    <span class="nv">versionControl</span><span class="p">:</span> <span class="kt"><a href="../Structs/VersionControlInfo.md">VersionControlInfo</a></span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span><span class="p">)</span></code></pre>

<p>Create a Version based on a Bundle, <strong>StageBuildDictionaryProtocol</strong>,
and an optional <strong>VersionControlInfo</strong>.</p>

### from(bundle:dictionary:withVersionControlInfoWithJsonResource:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="kd">func</span> <span class="nf">from</span><span class="p">(</span>
    <span class="nv">bundle</span><span class="p">:</span> <span class="kt"><a href="../Protocols/ResourceContainerProtocol.md">ResourceContainerProtocol</a></span> <span class="o">&amp;</span> <span class="kt"><a href="../Protocols/InfoDictionaryContainerProtocol.md">InfoDictionaryContainerProtocol</a></span><span class="p">,</span>
    <span class="nv">dictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span><span class="p">,</span>
    <span class="n">withVersionControlInfoWithJsonResource</span> <span class="nv">resource</span><span class="p">:</span> <span class="kt">String</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">Version</span><span class="p">?</span></code></pre>

<p>Create a Version based on a Bundle, <strong>StageBuildDictionaryProtocol</strong>,
and the name of the json resource file from autorevision.</p>

### description
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">description</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Creates a formatted string from the Version.</p>

### stageBuildNumber
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">stageBuildNumber</span><span class="p">:</span> <span class="kt">Int</span><span class="p">?</span></code></pre>

<p>The build number offset based on the Version stage.
Note: Starts at 1.</p>

### semverBuildNumber
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">semverBuildNumber</span><span class="p">:</span> <span class="kt">Int</span></code></pre>

<p>The build number offset based on the Version Semantic Version.
Note: Starts at 1.</p>

### stage
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">stage</span><span class="p">:</span> <span class="kt"><a href="../Enums/Stage.md">Stage</a></span><span class="p">?</span></code></pre>

<p>The stage based on the Version.</p>

### fullDescription
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">fullDescription</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>A Full Descripton which also contains the Sub-Semantic Version value
parsed from the VersionControlInfo.</p>

### subSemVerValue
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">subSemVerValue</span><span class="p">:</span> <span class="kt">Double</span></code></pre>

<p>The Sub-Semantic Version value parsed from the VersionControlInfo.</p>

### shortDescription
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">shortDescription</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Creates a shortened formatted string from the Version.</p>

