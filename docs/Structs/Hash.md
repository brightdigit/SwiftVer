# Hash
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">struct</span> <span class="kt">Hash</span><span class="p">:</span> <span class="kt">CustomStringConvertible</span><span class="p">,</span> <span class="kt">Equatable</span><span class="p">,</span> <span class="kt">Hashable</span></code></pre>

<p>Hash struct used for VersionControlInfo.</p>

### data
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">data</span><span class="p">:</span> <span class="kt">Data</span></code></pre>

<p>The Data of the Hash.</p>

### init(string:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span><span class="nv">string</span><span class="p">:</span> <span class="kt">String</span><span class="p">)</span></code></pre>

<p>Creates a Hash object based on a string.</p>

### description
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">description</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>Formats the data into a hex <strong>String</strong>.</p>

### hashValue
<pre class="highlight"><code><span class="kd">public</span> <span class="k">var</span> <span class="nv">hashValue</span><span class="p">:</span> <span class="kt">Int</span></code></pre>

<p>Hash value for equality.</p>

### ==(_:_:)
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">static</span> <span class="kd">func</span> <span class="o">==</span> <span class="p">(</span><span class="nv">lhs</span><span class="p">:</span> <span class="kt">Hash</span><span class="p">,</span> <span class="nv">rhs</span><span class="p">:</span> <span class="kt">Hash</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="kt">Bool</span></code></pre>

<p>Equality comparison of Hash objects.</p>

