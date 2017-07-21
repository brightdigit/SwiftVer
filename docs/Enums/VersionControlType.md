# VersionControlType
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">enum</span> <span class="kt">VersionControlType</span><span class="p">:</span> <span class="kt">CustomStringConvertible</span></code></pre>

<p>Version Control Type.</p>

### git
<pre class="highlight"><code><span class="k">case</span> <span class="n">git</span><span class="p">,</span></code></pre>

<p>Git</p>

### mercurial
<pre class="highlight"><code><span class="n">mercurial</span><span class="p">,</span></code></pre>

<p>Mercurial</p>

### subversion
<pre class="highlight"><code><span class="n">subversion</span><span class="p">,</span></code></pre>

<p>Subversion</p>

### bazaar
<pre class="highlight"><code><span class="n">bazaar</span><span class="p">,</span></code></pre>

<p>Bazaar</p>

### unknown
<pre class="highlight"><code><span class="n">unknown</span></code></pre>

<p>Unknown <strong>VersionControlType</strong></p>

### init(string:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span><span class="nv">string</span><span class="p">:</span> <span class="kt">String</span><span class="p">)</span></code></pre>

<p>Creates a <strong>VersionControlType</strong> based on the type <strong>String</strong>.</p>

### description
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">description</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Returns a <strong>String</strong> of the <strong>VersionControlType</strong>.</p>

