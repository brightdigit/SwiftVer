# Typealiases
<p>The following typealiases are available globally.</p>

### StageBuildDictionaryBase
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">typealias</span> <span class="kt">StageBuildDictionaryBase</span> <span class="o">=</span> <span class="p">[</span><span class="kt"><a href="Structs/SemVer.md">SemVer</a></span><span class="p">:</span> <span class="p">[</span><span class="kt"><a href="Enums/Stage.md">Stage</a></span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">]]</span></code></pre>

<p>Dictionary base mapping Semantic Version to Stages and Minimum Builds.</p>

### StageBuild
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">typealias</span> <span class="kt">StageBuild</span> <span class="o">=</span> <span class="p">(</span><span class="nv">stage</span><span class="p">:</span> <span class="kt"><a href="Enums/Stage.md">Stage</a></span><span class="p">,</span> <span class="nv">minimum</span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">)</span></code></pre>

<p>Tuple containing the stage and its minimum build number.</p>

