<div class="fluid-row" id="header">



<h1 class="title toc-ignore">GEE-Palettes</h1>
<h4 class="author"><em>Gennadii Donchyts &amp; Justin Braaten</em></h4>

</div>


<div id="about" class="section level1">
<h1>About</h1>
<p><em>GEE-Palettes</em> is a module for generating color palettes in <a href="https://earthengine.google.com/">Google Earth Engine</a> to be applied to mapped data.</p>
</div>
<div id="add-the-gee-palettes-module" class="section level1">
<h1>Add the <em>GEE-Palettes</em> module</h1>
<p>Visit this <a href="https://code.earthengine.google.com/?accept_repo=users/gena/palettes">URL</a> to add the module to your GEE account Reader repository.</p>
</div>
<div id="how-to-use" class="section level1">
<h1>How to use</h1>
<div id="load-the-module" class="section level4">
<h4>Load the module</h4>
<p>Once the module has been added to your GEE account, you can access it through the <code>require()</code> function. Running the following line will make the palettes available to you through JavaScript object access notation. Within <code>palettes</code> variable defined following will be a series of objects ending in arrays of hex colors.</p>
<pre><code>var palettes = require(&#39;users/gena/packages:palettes&#39;);
</code></pre>
</div>
<div id="find-a-palette" class="section level4">
<h4>Find a palette</h4>
<p>Find a palette you like from the list below. Each palette is defined by a group and a name, which are separated by a period (JS object dot notation).</p>
<p>To retrieve a desired palette, use JavaScript object notation to specify the group, name, and number of colors. The number of colors available varies by palette. To see what color levels are available, print the palette to the Console. Note that all non-ColorBrewer palettes have only 7 colors, so 7 should always be used as the ‘number-of-colors’ property, for these palettes.</p>
<pre><code>print(palettes.colorbrewer.RdYlGn);</code></pre>
<p>After determining the number of colors, set the palette as a variable.</p>
</div>
<div id="define-a-palette" class="section level4">
<h4>Define a palette</h4>
<pre><code>var palette = palettes.colorbrewer.RdYlGn[9];</code></pre>
</div>
<div id="apply-a-palette" class="section level4">
<h4>Apply a palette</h4>
<p>To apply the defined palette to map data, set the palette variable as the value for the <code>palette</code> key in the visParams object supplied to the <code>Map.addLayer()</code> function. It is also helpful to determine and define appropriate <code>min</code> and <code>max</code> values, to ensure a good stretch. Here is a complete working example for defining a palette and apply it to MODIS NDVI image.</p>
<pre><code>// Make a palette: a list of hex strings
var palettes = require(&#39;users/gena/packages:palettes&#39;);
var palette = palettes.colorbrewer.RdYlGn[9]

// Load a MODIS image
var img = ee.Image(&#39;MODIS/006/MOD09GA/2012_03_09&#39;);

// Calculate NDVI
var ndvi = img.normalizedDifference([&#39;sur_refl_b02&#39;, &#39;sur_refl_b01&#39;]);

// Center the map
Map.setCenter(-120.7671, 40.8328, 7);

// Display NDVI with defined palette stretched between selected min and max
Map.addLayer(ndvi, {min: -0.3, max: 0.7, palette: palette}, &#39;NDVI&#39;);</code></pre>
</div>
</div>
<div id="palette-manipulation" class="section level1">
<h1>Palette manipulation</h1>
<div id="palette-reverse" class="section level4">
<h4>Palette reverse</h4>
<p>Reverse a palette with the <code>reverse()</code> function</p>
<pre><code>var palette = palettes.colorbrewer.RdYlGn[9].reverse();
</code></pre>
</div>
<div id="palette-subset" class="section level4">
<h4>Palette subset</h4>
<p>If you only want to use a section of a palette, you can subset the colors you want using the <code>slice()</code> function. For instance, if you only want the pink to yellow section of the <em>misc.gnuplot</em> palette, try the following.</p>
<pre><code>var palette = palettes.misc.gnuplot[7].slice(3,7);</code></pre>
</div>
</div>
<div id="palettes" class="section level1">
<h1>Palettes</h1>
<div id="brewer-sequential" class="section level3">
<h3>Brewer Sequential</h3>
<p><img src="pals/Blues.png"> colorbrewer.Blues<br/><img src="pals/BuGn.png"> colorbrewer.BuGn<br/><img src="pals/BuPu.png"> colorbrewer.BuPu<br/><img src="pals/GnBu.png"> colorbrewer.GnBu<br/><img src="pals/Greens.png"> colorbrewer.Greens<br/><img src="pals/Greys.png"> colorbrewer.Greys<br/><img src="pals/Oranges.png"> colorbrewer.Oranges<br/><img src="pals/OrRd.png"> colorbrewer.OrRd<br/><img src="pals/PuBu.png"> colorbrewer.PuBu<br/><img src="pals/PuBuGn.png"> colorbrewer.PuBuGn<br/><img src="pals/PuRd.png"> colorbrewer.PuRd<br/><img src="pals/Purples.png"> colorbrewer.Purples<br/><img src="pals/RdPu.png"> colorbrewer.RdPu<br/><img src="pals/Reds.png"> colorbrewer.Reds<br/><img src="pals/YlGn.png"> colorbrewer.YlGn<br/><img src="pals/YlGnBu.png"> colorbrewer.YlGnBu<br/><img src="pals/YlOrBr.png"> colorbrewer.YlOrBr<br/><img src="pals/YlOrRd.png"> colorbrewer.YlOrRd<br/></p>
</div>
<div id="brewer-diverging" class="section level3">
<h3>Brewer Diverging</h3>
<p><img src="pals/BrBG.png"> colorbrewer.BrBG<br/><img src="pals/PiYG.png"> colorbrewer.PiYG<br/><img src="pals/PRGn.png"> colorbrewer.PRGn<br/><img src="pals/PuOr.png"> colorbrewer.PuOr<br/><img src="pals/RdBu.png"> colorbrewer.RdBu<br/><img src="pals/RdGy.png"> colorbrewer.RdGy<br/><img src="pals/RdYlBu.png"> colorbrewer.RdYlBu<br/><img src="pals/RdYlGn.png"> colorbrewer.RdYlGn<br/><img src="pals/Spectral.png"> colorbrewer.Spectral<br/></p>
</div>
<div id="brewer-qualtitative" class="section level3">
<h3>Brewer Qualtitative</h3>
<p><img src="pals/Accent.png"> colorbrewer.Accent<br/><img src="pals/Dark2.png"> colorbrewer.Dark2<br/><img src="pals/Paired.png"> colorbrewer.Paired<br/><img src="pals/Pastel1.png"> colorbrewer.Pastel1<br/><img src="pals/Pastel2.png"> colorbrewer.Pastel2<br/><img src="pals/Set1.png"> colorbrewer.Set1<br/><img src="pals/Set2.png"> colorbrewer.Set2<br/><img src="pals/Set3.png"> colorbrewer.Set3<br/></p>
</div>
<div id="matplotlib" class="section level3">
<h3>Matplotlib</h3>
<p><img src="pals/magma.png"> matplotlib.magma<br/><img src="pals/inferno.png"> matplotlib.inferno<br/><img src="pals/plasma.png"> matplotlib.plasma<br/><img src="pals/viridis.png"> matplotlib.viridis<br/></p>
</div>
<div id="ocean" class="section level3">
<h3>Ocean</h3>
<p><img src="pals/Thermal.png"> cmocean.Thermal<br/><img src="pals/Haline.png"> cmocean.Haline<br/><img src="pals/Solar.png"> cmocean.Solar<br/><img src="pals/Ice.png"> cmocean.Ice<br/><img src="pals/Gray.png"> cmocean.Gray<br/><img src="pals/Oxy.png"> cmocean.Oxy<br/><img src="pals/Deep.png"> cmocean.Deep<br/><img src="pals/Dense.png"> cmocean.Dense<br/><img src="pals/Algae.png"> cmocean.Algae<br/><img src="pals/Matter.png"> cmocean.Matter<br/><img src="pals/Turbid.png"> cmocean.Turbid<br/><img src="pals/Speed.png"> cmocean.Speed<br/><img src="pals/Amp.png"> cmocean.Amp<br/><img src="pals/Tempo.png"> cmocean.Tempo<br/><img src="pals/Phase.png"> cmocean.Phase<br/><img src="pals/Balance.png"> cmocean.Balance<br/><img src="pals/Delta.png"> cmocean.Delta<br/><img src="pals/Curl.png"> cmocean.Curl<br/></p>
</div>
<div id="niccoli" class="section level3">
<h3>Niccoli</h3>
<p><img src="pals/cubicyf.png"> niccoli.cubicyf<br/><img src="pals/cubicl.png"> niccoli.cubicl<br/><img src="pals/isol.png"> niccoli.isol<br/><img src="pals/linearl.png"> niccoli.linearl<br/><img src="pals/linearlhot.png"> niccoli.linearlhot<br/></p>
</div>
<div id="kovesi" class="section level3">
<h3>Kovesi</h3>
<p><img src="pals/cyclic_grey_15_85_c0.png"> kovesi.cyclic_grey_15_85_c0<br/><img src="pals/cyclic_grey_15_85_c0_s25.png"> kovesi.cyclic_grey_15_85_c0_s25<br/><img src="pals/cyclic_mrybm_35_75_c68.png"> kovesi.cyclic_mrybm_35_75_c68<br/><img src="pals/cyclic_mrybm_35_75_c68_s25.png"> kovesi.cyclic_mrybm_35_75_c68_s25<br/><img src="pals/cyclic_mygbm_30_95_c78.png"> kovesi.cyclic_mygbm_30_95_c78<br/><img src="pals/cyclic_mygbm_30_95_c78_s25.png"> kovesi.cyclic_mygbm_30_95_c78_s25<br/><img src="pals/cyclic_wrwbw_40_90_c42.png"> kovesi.cyclic_wrwbw_40_90_c42<br/><img src="pals/cyclic_wrwbw_40_90_c42_s25.png"> kovesi.cyclic_wrwbw_40_90_c42_s25<br/><img src="pals/diverging_isoluminant_cjm_75_c23.png"> kovesi.diverging_isoluminant_cjm_75_c23<br/><img src="pals/diverging_isoluminant_cjm_75_c24.png"> kovesi.diverging_isoluminant_cjm_75_c24<br/><img src="pals/diverging_isoluminant_cjo_70_c25.png"> kovesi.diverging_isoluminant_cjo_70_c25<br/><img src="pals/diverging_linear_bjr_30_55_c53.png"> kovesi.diverging_linear_bjr_30_55_c53<br/><img src="pals/diverging_linear_bjy_30_90_c45.png"> kovesi.diverging_linear_bjy_30_90_c45<br/><img src="pals/diverging_rainbow_bgymr_45_85_c67.png"> kovesi.diverging_rainbow_bgymr_45_85_c67<br/><img src="pals/diverging_bkr_55_10_c35.png"> kovesi.diverging_bkr_55_10_c35<br/><img src="pals/diverging_bky_60_10_c30.png"> kovesi.diverging_bky_60_10_c30<br/><img src="pals/diverging_bwr_40_95_c42.png"> kovesi.diverging_bwr_40_95_c42<br/><img src="pals/diverging_bwr_55_98_c37.png"> kovesi.diverging_bwr_55_98_c37<br/><img src="pals/diverging_cwm_80_100_c22.png"> kovesi.diverging_cwm_80_100_c22<br/><img src="pals/diverging_gkr_60_10_c40.png"> kovesi.diverging_gkr_60_10_c40<br/><img src="pals/diverging_gwr_55_95_c38.png"> kovesi.diverging_gwr_55_95_c38<br/><img src="pals/diverging_gwv_55_95_c39.png"> kovesi.diverging_gwv_55_95_c39<br/><img src="pals/isoluminant_cgo_70_c39.png"> kovesi.isoluminant_cgo_70_c39<br/><img src="pals/isoluminant_cgo_80_c38.png"> kovesi.isoluminant_cgo_80_c38<br/><img src="pals/isoluminant_cm_70_c39.png"> kovesi.isoluminant_cm_70_c39<br/><img src="pals/rainbow_bgyr_35_85_c72.png"> kovesi.rainbow_bgyr_35_85_c72<br/><img src="pals/rainbow_bgyr_35_85_c73.png"> kovesi.rainbow_bgyr_35_85_c73<br/><img src="pals/rainbow_bgyrm_35_85_c69.png"> kovesi.rainbow_bgyrm_35_85_c69<br/><img src="pals/rainbow_bgyrm_35_85_c71.png"> kovesi.rainbow_bgyrm_35_85_c71<br/><img src="pals/linear_bgy_10_95_c74.png"> kovesi.linear_bgy_10_95_c74<br/><img src="pals/linear_bgyw_15_100_c67.png"> kovesi.linear_bgyw_15_100_c67<br/><img src="pals/linear_bgyw_15_100_c68.png"> kovesi.linear_bgyw_15_100_c68<br/><img src="pals/linear_blue_5_95_c73.png"> kovesi.linear_blue_5_95_c73<br/><img src="pals/linear_blue_95_50_c20.png"> kovesi.linear_blue_95_50_c20<br/><img src="pals/linear_bmw_5_95_c86.png"> kovesi.linear_bmw_5_95_c86<br/><img src="pals/linear_bmw_5_95_c89.png"> kovesi.linear_bmw_5_95_c89<br/><img src="pals/linear_bmy_10_95_c71.png"> kovesi.linear_bmy_10_95_c71<br/><img src="pals/linear_bmy_10_95_c78.png"> kovesi.linear_bmy_10_95_c78<br/><img src="pals/linear_gow_60_85_c27.png"> kovesi.linear_gow_60_85_c27<br/><img src="pals/linear_gow_65_90_c35.png"> kovesi.linear_gow_65_90_c35<br/><img src="pals/linear_green_5_95_c69.png"> kovesi.linear_green_5_95_c69<br/><img src="pals/linear_grey_0_100_c0.png"> kovesi.linear_grey_0_100_c0<br/><img src="pals/linear_grey_10_95_c0.png"> kovesi.linear_grey_10_95_c0<br/><img src="pals/linear_kry_5_95_c72.png"> kovesi.linear_kry_5_95_c72<br/><img src="pals/linear_kry_5_98_c75.png"> kovesi.linear_kry_5_98_c75<br/><img src="pals/linear_kryw_5_100_c64.png"> kovesi.linear_kryw_5_100_c64<br/><img src="pals/linear_kryw_5_100_c67.png"> kovesi.linear_kryw_5_100_c67<br/><img src="pals/linear_ternary_blue_0_44_c57.png"> kovesi.linear_ternary_blue_0_44_c57<br/><img src="pals/linear_ternary_green_0_46_c42.png"> kovesi.linear_ternary_green_0_46_c42<br/><img src="pals/linear_ternary_red_0_50_c52.png"> kovesi.linear_ternary_red_0_50_c52<br/></p>
</div>
<div id="misc" class="section level3">
<h3>Misc</h3>
<p><img src="pals/coolwarm.png"> misc.coolwarm<br/><img src="pals/warmcool.png"> misc.warmcool<br/><img src="pals/cubehelix.png"> misc.cubehelix<br/><img src="pals/gnuplot.png"> misc.gnuplot<br/><img src="pals/jet.png"> misc.jet<br/><img src="pals/parula.png"> misc.parula<br/><img src="pals/tol_rainbow.png"> misc.tol_rainbow<br/><img src="pals/cividis.png"> misc.cividis<br/></p>
</div>
</div>
<div id="references" class="section level1">
<h1>References</h1>
<p>Palettes were derived from the <em>pals</em> R library. Please see its <a href="https://cran.r-project.org/web/packages/pals/pals.pdf">documentation</a> and <a href="https://github.com/kwstat/pals">repository</a> for palette source information.</p>
</div>




</div>