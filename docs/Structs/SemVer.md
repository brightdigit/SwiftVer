# SemVer
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">struct</span> <span class="kt">SemVer</span><span class="p">:</span> <span class="kt">CustomStringConvertible</span><span class="p">,</span> <span class="kt">Comparable</span><span class="p">,</span> <span class="kt">Equatable</span><span class="p">,</span> <span class="kt">Hashable</span></code></pre>

<p>Semantic Version.</p>

### major
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">major</span><span class="p">:</span> <span class="kt">UInt8</span></code></pre>

<p>Major version number when you make incompatible API changes.</p>

### minor
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">minor</span><span class="p">:</span> <span class="kt">UInt8</span></code></pre>

<p>Minor version when you add functionality in a backwards-compatible manner.</p>

### patch
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">patch</span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">?</span></code></pre>

<p>Patch version when you make backwards-compatible bug fixes.</p>

### init(major:minor:patch:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span><span class="nv">major</span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">,</span> <span class="nv">minor</span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">,</span> <span class="nv">patch</span><span class="p">:</span> <span class="kt">UInt8</span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span><span class="p">)</span></code></pre>

<p>Creates Semantic Version Object.</p>

### init(versionString:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span><span class="nv">versionString</span><span class="p">:</span> <span class="kt">String</span><span class="p">)</span></code></pre>

<p>Creates Semantic Version Object from a String.</p>

### init(major:minor:patch:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span><span class="nv">major</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span> <span class="nv">minor</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span> <span class="nv">patch</span><span class="p">:</span> <span class="kt">String</span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span><span class="p">)</span></code></pre>

<p>Creates Semantic Version Object from a series of Strings.</p>

### description
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">description</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Formatted SemVer String.</p>

### hashValue
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">hashValue</span><span class="p">:</span> <span class="kt">Int</span></code></pre>

<p>HashValue for comparison.</p>

### ==(_:_:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="kd">func</span> <span class="o">==</span> <span class="p">(</span><span class="nv">lhs</span><span class="p">:</span> <span class="kt">SemVer</span><span class="p">,</span> <span class="nv">rhs</span><span class="p">:</span> <span class="kt">SemVer</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">Bool</span></code></pre>

<p>Equality comparison of SemVer objects.</p>

### &lt;(_:_:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="kd">func</span> <span class="o">&lt;</span> <span class="p">(</span><span class="nv">lhs</span><span class="p">:</span> <span class="kt">SemVer</span><span class="p">,</span> <span class="nv">rhs</span><span class="p">:</span> <span class="kt">SemVer</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">Bool</span></code></pre>

<p>Comparison of SemVer objects.</p>

