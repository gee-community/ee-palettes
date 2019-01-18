# A set of common color palettes for Google Earth Engine

## GEE-Palettes

Gennadii Donchyts, Fedor Baart & Justin Braaten

## About

GEE-Palettes is a module for generating color palettes in Google Earth Engine to be applied to mapped data.

## Add the GEE-Palettes module
Visit this URL to add the module to your GEE account Reader repository.

## How to use
### Load the module
Once the module has been added to your GEE account, you can access it through the require() function. Running the following line will make the palettes available to you through JavaScript object access notation. Within palettes variable defined following will be a series of objects ending in arrays of hex colors.

```
var palettes = require('users/gena/packages:palettes');
```

### Find a palette
Find a palette you like from the list below. Each palette is defined by a group and a name, which are separated by a period (JS object dot notation).

To retrieve a desired palette, use JavaScript object notation to specify the group, name, and number of colors. The number of colors available varies by palette. To see what color levels are available, print the palette to the Console. Note that all non-ColorBrewer palettes have only 7 colors, so 7 should always be used as the ‘number-of-colors’ property, for these palettes.

```javascript
print(palettes.colorbrewer.RdYlGn);
```

After determining the number of colors, set the palette as a variable.

### Define a palette

```javascript
var palette = palettes.colorbrewer.RdYlGn[9];
```

### Apply a palette
To apply the defined palette to map data, set the palette variable as the value for the palette key in the visParams object supplied to the  Map.addLayer() function. It is also helpful to determine and define appropriate min and max values, to ensure a good stretch. Here is a complete working example for defining a palette and apply it to MODIS NDVI image.

```javascript
// Make a palette: a list of hex strings
var palettes = require('users/gena/packages:palettes');
var palette = palettes.colorbrewer.RdYlGn[9]

// Load a MODIS image
var img = ee.Image('MODIS/006/MOD09GA/2012_03_09');

// Calculate NDVI
var ndvi = img.normalizedDifference(['sur_refl_b02', 'sur_refl_b01']);

// Center the map
Map.setCenter(-120.7671, 40.8328, 7);

// Display NDVI with defined palette stretched between selected min and max
Map.addLayer(ndvi, {min: -0.3, max: 0.7, palette: palette}, 'NDVI');
```

## Palette manipulation

### Palette reverse
Reverse a palette with the reverse() function

```javascript
var palette = palettes.colorbrewer.RdYlGn[9].reverse();
```

### Palette subset
If you only want to use a section of a palette, you can subset the colors you want using the slice() function. For instance, if you only want the pink to yellow section of the misc.gnuplot palette, try the following.

```
var palette = palettes.misc.gnuplot[7].slice(3,7);
````

## Palettes

### Brewer Sequential
 colorbrewer.Blues
 colorbrewer.BuGn
 colorbrewer.BuPu
 colorbrewer.GnBu
 colorbrewer.Greens
 colorbrewer.Greys
 colorbrewer.Oranges
 colorbrewer.OrRd
 colorbrewer.PuBu
 colorbrewer.PuBuGn
 colorbrewer.PuRd
 colorbrewer.Purples
 colorbrewer.RdPu
 colorbrewer.Reds
 colorbrewer.YlGn
 colorbrewer.YlGnBu
 colorbrewer.YlOrBr
 colorbrewer.YlOrRd

### Brewer Diverging
 colorbrewer.BrBG
 colorbrewer.PiYG
 colorbrewer.PRGn
 colorbrewer.PuOr
 colorbrewer.RdBu
 colorbrewer.RdGy
 colorbrewer.RdYlBu
 colorbrewer.RdYlGn
 colorbrewer.Spectral

### Brewer Qualtitative
 colorbrewer.Accent
 colorbrewer.Dark2
 colorbrewer.Paired
 colorbrewer.Pastel1
 colorbrewer.Pastel2
 colorbrewer.Set1
 colorbrewer.Set2
 colorbrewer.Set3

### Matplotlib
 matplotlib.magma
 matplotlib.inferno
 matplotlib.plasma
 matplotlib.viridis

### Ocean
 cmocean.Thermal
 cmocean.Haline
 cmocean.Solar
 cmocean.Ice
 cmocean.Gray
 cmocean.Oxy
 cmocean.Deep
 cmocean.Dense
 cmocean.Algae
 cmocean.Matter
 cmocean.Turbid
 cmocean.Speed
 cmocean.Amp
 cmocean.Tempo
 cmocean.Phase
 cmocean.Balance
 cmocean.Delta
 cmocean.Curl

### Niccoli
 niccoli.cubicyf
 niccoli.cubicl
 niccoli.isol
 niccoli.linearl
 niccoli.linearlhot

### Kovesi
 kovesi.cyclic_grey_15_85_c0
 kovesi.cyclic_grey_15_85_c0_s25
 kovesi.cyclic_mrybm_35_75_c68
 kovesi.cyclic_mrybm_35_75_c68_s25
 kovesi.cyclic_mygbm_30_95_c78
 kovesi.cyclic_mygbm_30_95_c78_s25
 kovesi.cyclic_wrwbw_40_90_c42
 kovesi.cyclic_wrwbw_40_90_c42_s25
 kovesi.diverging_isoluminant_cjm_75_c23
 kovesi.diverging_isoluminant_cjm_75_c24
 kovesi.diverging_isoluminant_cjo_70_c25
 kovesi.diverging_linear_bjr_30_55_c53
 kovesi.diverging_linear_bjy_30_90_c45
 kovesi.diverging_rainbow_bgymr_45_85_c67
 kovesi.diverging_bkr_55_10_c35
 kovesi.diverging_bky_60_10_c30
 kovesi.diverging_bwr_40_95_c42
 kovesi.diverging_bwr_55_98_c37
 kovesi.diverging_cwm_80_100_c22
 kovesi.diverging_gkr_60_10_c40
 kovesi.diverging_gwr_55_95_c38
 kovesi.diverging_gwv_55_95_c39
 kovesi.isoluminant_cgo_70_c39
 kovesi.isoluminant_cgo_80_c38
 kovesi.isoluminant_cm_70_c39
 kovesi.rainbow_bgyr_35_85_c72
 kovesi.rainbow_bgyr_35_85_c73
 kovesi.rainbow_bgyrm_35_85_c69
 kovesi.rainbow_bgyrm_35_85_c71
 kovesi.linear_bgy_10_95_c74
 kovesi.linear_bgyw_15_100_c67
 kovesi.linear_bgyw_15_100_c68
 kovesi.linear_blue_5_95_c73
 kovesi.linear_blue_95_50_c20
 kovesi.linear_bmw_5_95_c86
 kovesi.linear_bmw_5_95_c89
 kovesi.linear_bmy_10_95_c71
 kovesi.linear_bmy_10_95_c78
 kovesi.linear_gow_60_85_c27
 kovesi.linear_gow_65_90_c35
 kovesi.linear_green_5_95_c69
 kovesi.linear_grey_0_100_c0
 kovesi.linear_grey_10_95_c0
 kovesi.linear_kry_5_95_c72
 kovesi.linear_kry_5_98_c75
 kovesi.linear_kryw_5_100_c64
 kovesi.linear_kryw_5_100_c67
 kovesi.linear_ternary_blue_0_44_c57
 kovesi.linear_ternary_green_0_46_c42
 kovesi.linear_ternary_red_0_50_c52

### Misc
 misc.coolwarm
 misc.warmcool
 misc.cubehelix
 misc.gnuplot
 misc.jet
 misc.parula
 misc.tol_rainbow
 misc.cividis

## References
Palettes were derived from the pals R library. Please see its documentation and repository for palette source information.
