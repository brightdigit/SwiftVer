# ResourceContainerProtocol
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">protocol</span> <span class="kt">ResourceContainerProtocol</span></code></pre>

<p>Container for Resources.</p>

### url(forResource:withExtension:subdirectory:)
<pre class="highlight"><code><span class="kd">func</span> <span class="nf">url</span><span class="p">(</span><span class="n">forResource</span> <span class="nv">name</span><span class="p">:</span> <span class="kt">String</span><span class="p">?,</span> <span class="n">withExtension</span> <span class="nv">ext</span><span class="p">:</span> <span class="kt">String</span><span class="p">?,</span> <span class="n">subdirectory</span> <span class="nv">subpath</span><span class="p">:</span> <span class="kt">String</span><span class="p">?)</span> <span class="o">-&gt;</span> <span class="kt">URL</span><span class="p">?</span></code></pre>

<p>Returns the file URL for the resource file identified by the specified name and extension and residing in a given bundle directory.</p>

