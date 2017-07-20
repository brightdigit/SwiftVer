# StageBuildDictionaryProtocol
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">protocol</span> <span class="kt">StageBuildDictionaryProtocol</span></code></pre>

<p>Dictionary which has Semantic Versions, Stages, and Minimum Builds.</p>

### semvers
<pre class="highlight"><code><span class="k">var</span> <span class="nv">semvers</span><span class="p">:</span> <span class="p">[</span><span class="kt"><a href="../Structs/SemVer.md">SemVer</a></span><span class="p">]</span></code></pre>

<p>List of all Semantic Versions.</p>

### minimumBuild(forSemVer:)
<pre class="highlight"><code><span class="kd">func</span> <span class="nf">minimumBuild</span><span class="p">(</span><span class="n">forSemVer</span> <span class="nv">semVer</span><span class="p">:</span> <span class="kt"><a href="../Structs/SemVer.md">SemVer</a></span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">UInt8</span><span class="p">?</span></code></pre>

<p>Minimum Build Number for a Semantic Version.</p>

### minimumStageBuildNumber(forSemVer:atStage:)
<pre class="highlight"><code><span class="kd">func</span> <span class="nf">minimumStageBuildNumber</span><span class="p">(</span><span class="n">forSemVer</span> <span class="nv">semver</span><span class="p">:</span> <span class="kt"><a href="../Structs/SemVer.md">SemVer</a></span><span class="p">,</span> <span class="n">atStage</span> <span class="nv">stage</span><span class="p">:</span> <span class="kt"><a href="../Enums/Stage.md">Stage</a></span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">Int</span></code></pre>

<p>Minimum Build Number for a Semantic Version and Stage.</p>

### stage(withBuildForVersion:)
<pre class="highlight"><code><span class="kd">func</span> <span class="nf">stage</span><span class="p">(</span><span class="n">withBuildForVersion</span> <span class="nv">version</span><span class="p">:</span> <span class="kt"><a href="../Structs/Version.md">Version</a></span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt"><a href="../Typealiases.md#/s:8SwiftVer10StageBuilda">StageBuild</a></span><span class="p">?</span></code></pre>

<p>StageBuild based on Version</p>

### minimumSemVerBuildNumber(forSemVer:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">protocol</span> <span class="kt">StageBuildDictionaryProtocol</span></code></pre>

Extension method
<p>Undocumented</p>

