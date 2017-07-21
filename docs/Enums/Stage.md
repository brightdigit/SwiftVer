# Stage
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">enum</span> <span class="kt">Stage</span><span class="p">:</span> <span class="kt">CustomStringConvertible</span></code></pre>

<p>Stage Enumeration.</p>

### dictionary(fromPlistAtURL:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="kd">func</span> <span class="nf">dictionary</span><span class="p">(</span><span class="n">fromPlistAtURL</span> <span class="nv">url</span><span class="p">:</span> <span class="kt">URL</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span><span class="p">?</span></code></pre>

<p>Builds a StageBuildDictionaryProtocol from a plist.</p>

### emptyDictionary
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="k">var</span> <span class="nv">emptyDictionary</span><span class="p">:</span> <span class="kt"><a href="../Protocols/StageBuildDictionaryProtocol.md">StageBuildDictionaryProtocol</a></span></code></pre>

<p>Returns an empty StageBuildDictionaryProtocol.</p>

### all
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="k">let</span> <span class="nv">all</span><span class="p">:</span> <span class="kt">Set</span><span class="o">&lt;</span><span class="kt">Stage</span><span class="o">&gt;</span> <span class="o">=</span> <span class="p">[</span><span class="o">.</span><span class="n"><a href="../Enums/Stage.md#/s:8SwiftVer5StageO5alphaA2CmF">alpha</a></span><span class="p">,</span> <span class="o">.</span><span class="n"><a href="../Enums/Stage.md#/s:8SwiftVer5StageO4betaA2CmF">beta</a></span><span class="p">,</span> <span class="o">.</span><span class="n"><a href="../Enums/Stage.md#/s:8SwiftVer5StageO10productionA2CmF">production</a></span><span class="p">]</span></code></pre>

<p>A list of all the stages.</p>

### description
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">description</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Returns a String Description of the Stage.</p>

### init(string:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span><span class="nv">string</span><span class="p">:</span> <span class="kt">String</span><span class="p">)</span></code></pre>

<p>Tries to create the Stage based on the String.</p>

### alpha
<pre class="highlight"><code><span class="k">case</span> <span class="n">alpha</span><span class="p">,</span></code></pre>

<p>Alpha</p>

### beta
<pre class="highlight"><code><span class="n">beta</span><span class="p">,</span></code></pre>

<p>Beta</p>

### production
<pre class="highlight"><code><span class="n">production</span></code></pre>

<p>Production</p>

