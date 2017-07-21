# VersionControlInfo
<pre class="highlight"><code><span class="kd">public</span> <span class="kd">struct</span> <span class="kt">VersionControlInfo</span></code></pre>

<p>The Current-Revision Metadata from the Version Control Repository.</p>

### type
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">type</span><span class="p">:</span> <span class="kt"><a href="../Enums/VersionControlType.md">VersionControlType</a></span></code></pre>

<p>The VersionControlType.</p>

### baseName
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">baseName</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>The basename of the directory root.</p>

### uuid
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">uuid</span><span class="p">:</span> <span class="kt"><a href="../Structs/Hash.md">Hash</a></span><span class="p">?</span></code></pre>

<p>A universally unique identifier, generated from the root commit in git and hg;
for svn it uses the supplied UUID.</p>

### number
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">number</span><span class="p">:</span> <span class="kt">Int</span></code></pre>

<p>A count of revisions between the current one and the initial one; useful for reporting build numbers.</p>

### date
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">date</span><span class="p">:</span> <span class="kt">Date</span><span class="p">?</span></code></pre>

<p>The date of the most recent commit.</p>

### branch
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">branch</span><span class="p">:</span> <span class="kt">String</span></code></pre>

<p>The name of the branch of the commit graph that was selected when autoversion was run.</p>

### tag
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">tag</span><span class="p">:</span> <span class="kt">String</span><span class="p">?</span></code></pre>

<p>The name of the most recent tag ancestral to the current commit.</p>

### tick
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">tick</span><span class="p">:</span> <span class="kt">Int</span><span class="p">?</span></code></pre>

<p>A count of commits since most recent tag ancestral to the current commit.</p>

### extra
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">extra</span><span class="p">:</span> <span class="kt">String</span><span class="p">?</span></code></pre>

<p>A symbol set aside specifically to be set by the user through the environment or via scripts.</p>

### hash
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">hash</span><span class="p">:</span> <span class="kt"><a href="../Structs/Hash.md">Hash</a></span></code></pre>

<p>A full unique identifier for the current revision.</p>

### isWorkingCopyModified
<pre class="highlight"><code><span class="kd">public</span> <span class="k">let</span> <span class="nv">isWorkingCopyModified</span><span class="p">:</span> <span class="kt">Bool</span></code></pre>

<p>If the current working directory has been modified.</p>

### init(type:baseName:uuid:number:date:branch:tag:tick:extra:hash:isWorkingCopyModified:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span><span class="nv">type</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span>
              <span class="nv">baseName</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span>
              <span class="nv">uuid</span><span class="p">:</span> <span class="kt"><a href="../Structs/Hash.md">Hash</a></span><span class="p">?,</span>
              <span class="nv">number</span><span class="p">:</span> <span class="kt">Int</span><span class="p">,</span>
              <span class="nv">date</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span>
              <span class="nv">branch</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span>
              <span class="nv">tag</span><span class="p">:</span> <span class="kt">String</span><span class="p">?,</span>
              <span class="nv">tick</span><span class="p">:</span> <span class="kt">Int</span><span class="p">?,</span>
              <span class="nv">extra</span><span class="p">:</span> <span class="kt">String</span><span class="p">?,</span>
              <span class="nv">hash</span><span class="p">:</span> <span class="kt"><a href="../Structs/Hash.md">Hash</a></span><span class="p">,</span>

              <span class="nv">isWorkingCopyModified</span><span class="p">:</span> <span class="kt">Bool</span><span class="p">)</span></code></pre>

<p>Creates a VersionControlInfo object.</p>

### init(basedOn:tick:extra:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">(</span><span class="n">basedOn</span> <span class="nv">parent</span><span class="p">:</span> <span class="kt">VersionControlInfo</span><span class="p">,</span> <span class="nv">tick</span><span class="p">:</span> <span class="kt">Int</span><span class="p">,</span> <span class="nv">extra</span><span class="p">:</span> <span class="kt">String</span><span class="p">?)</span></code></pre>

<p>Creates a VersionControlInfo object based a previous one with an updated tick and extra info.</p>

### init(jsonResource:fromBundle:inDirectory:)
<pre class="highlight"><code><span class="kd">public</span> <span class="nf">init</span><span class="p">?(</span>
    <span class="nv">jsonResource</span><span class="p">:</span> <span class="kt">String</span><span class="p">,</span>
    <span class="n">fromBundle</span> <span class="nv">bundle</span><span class="p">:</span> <span class="kt"><a href="../Protocols/ResourceContainerProtocol.md">ResourceContainerProtocol</a></span><span class="p">,</span>
    <span class="n">inDirectory</span> <span class="nv">directory</span><span class="p">:</span> <span class="kt">String</span><span class="p">?</span> <span class="o">=</span> <span class="kc">nil</span>
  <span class="p">)</span></code></pre>

<p>Tries to parse the json resource from the bundle based on the directory.</p>

