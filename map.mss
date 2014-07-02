@color_physical: #000;
@color_physical_bright: #fff;
@color_water: #000;
@color_administrative_dark: #000;
@color_administrative_bright: #fff;
@color_administrative_medium_low: #000;
@color_administrative_medium_high: #000;
@color_administrative_medium_high2: #000;
@color_transport: #000;
@color_transport_casing: #fff;
@color_transport_inline: #fff;
@color_transport_tunnel: #ccc;
@color_transport_minor: #ccc;
@color_transport_rail: #444;
@color_transport_path: #ededed;
@color_building_outline: #000;
@color_building_outline_special: #00aeef;
@color_airport_runways: #eee;
@color_airport_runways_detail: #f2f2f2;

Map {
  background-color: @color_physical;
  font-directory: url("fonts/");
}

/**
 * "shore" is a general class for layers with continents, coastlines, lakes,
 * and other kinds of meeting points between water and land.
 */
.shore {
  line-color: @color_physical;
  line-cap: round;
  line-join: round;
  line-width: 0;
}

#country-shapes-110m {
  line-width: 0.25;
  polygon-fill: @color_administrative_bright;
}

#land-shapes-110m,
#country-shapes-50m,
#country-shapes-10m,
{
  line-width: 0.25;
  polygon-fill: @color_physical_bright;
}

.country-boundary-10m {
  ::whiteout {
    [zoom>=7] {
      line-color: @color_administrative_bright;
      line-width: 2;
    }
  }

  [zoom>=6] {
    line-color: @color_administrative_dark;
    line-width: 1.2;
  }

  [zoom>=7] {
    line-width: 1.2;
    line-dasharray: 3,7;
    line-cap: round;
  }
}

#admin1-lines-50m {
  line-width: 0.35;
  line-color: @color_administrative_dark;
}

#admin1-lines-10m {
  [zoom>=6] {
    line-width: 0.6;
    line-color: @color_administrative_dark;
  }

  [zoom>=7] {
    line-width: 1.5;
    line-color: @color_administrative_medium_low;
    line-dasharray: 1,5;
    line-cap: round;
  }

  [zoom>=8] {
    line-width: 2.0;
    line-color: @color_administrative_medium_high;
  }

  [zoom>=9] {
    line-color: @color_administrative_medium_high2;
  }
}

#lakes-110m[zoom<3][scalerank<1],
#lakes-50m[zoom=3][scalerank<2],
#lakes-50m[zoom=4][scalerank<3],
#lakes-50m[zoom=5][scalerank<5],
#lakes-50m[zoom=6],
#lakes-10m,
{
  line-width: 1;
  polygon-fill: @color_physical;
}

#ne-roads {
  ::casing {
    line-color: @color_transport_casing;
    line-opacity: 0.5;
    line-width: 0;

    [zoom=7][scalerank<=7] {
      line-width: 2.25;
    }

    [zoom=8][scalerank<=8] {
      line-width: 3.25;
    }
  }

  line-color: @color_transport;
  line-width: 0;

  [zoom=6][scalerank>=3][scalerank<=6] {
    line-width: 0.1;
  }

  [zoom=7] {
    [scalerank<=6],
    [scalerank<=7][expressway=1],
    [scalerank<=7][type='Major Highway'],
    [scalerank<=7][type='Secondary Highway'],
    {
      line-width: 0.1;
    }

    [scalerank>=3][scalerank<=5] {
      line-width: 1.5;
    }
  }

  [zoom=8] {
    [scalerank<=8] {
      line-width: 0.1;
    }

    [type='Beltway'],
    [scalerank<=8][expressway=1],
    {
      line-width: 1.5;
    }
  }
}

/**
 * Ocean, lake, and river polygons
 */
#water-bodies-low[zoom=8][area>50000000],
#water-bodies-low[zoom=9][area>10000000],
#water-bodies-low[zoom=10][area>2500000],
#water-bodies-med[zoom=11][area> 800000],
#water-bodies-med[zoom=12][area> 500000],
#water-bodies-med[zoom=13][area>  25000],
#water-bodies-high[zoom=14][area> 10000],
#water-bodies-high[zoom>=15]
{ 
  polygon-fill: @color_water;
}

/**
 * Water bodies that are parts of rivers
 * should never be filtered
 */
#water-bodies-low[type='riverbank'],
#water-bodies-med[type='riverbank'],
#water-bodies-high[type='riverbank']
{ 
  polygon-fill: @color_water;
}

#land {
  polygon-fill: @color_physical_bright;
}

#admin1-lines-osm,
{
  line-width: 2.0;
  line-color: @color_administrative_medium_high2;
  line-dasharray: 1,5;
  line-cap: round;
}

#buildings-med {
  [area>=40000] {
    polygon-pattern-file: url("images/stripe_sm.png");
    line-width: 0.5;
    line-color: @color_building_outline;
  }
}

#buildings-high {
  [zoom>=14] {
    [area>=20000] {
      polygon-pattern-file: url("images/stripe_med.png");
      line-width: 0.5;
      line-color: @color_building_outline;
    }
  }

  [zoom>=16] {
    line-width: 0.5;
  }

  [zoom=15][area>=16000],
  [zoom=16][area>=8000],
  [zoom=17][area>=4000],
  [zoom>=18],
  {
    polygon-pattern-file: url("images/stripe.png");
    polygon-pattern-alignment: global;
    line-width: 0.5;
    line-color: @color_building_outline;
  }

  // Stamen HQ fancy candycane striping
  [zoom>=18] {
    [osm_id=45074542],
    [osm_id=224030635], // Seth's house
    {
      polygon-pattern-file: url("images/stripe_color.png");
      line-width: 1.5;
      line-color: @color_building_outline_special;
    }
  }
}

#green-areas-low[zoom=10][area>5000000],
#green-areas-med[zoom=11][area>1000000],
#green-areas-med[zoom=12][area> 500000],
#green-areas-med[zoom=12][area> 200000],
#green-areas-med[zoom=13][area>  75000],
#green-areas-high[zoom=14][area> 10000],
#green-areas-high[zoom>14],
{
  polygon-pattern-alignment: global;
  polygon-pattern-file: url("images/halftone2.png");
  
  [type='nature_reserve'] {
      polygon-pattern-file: url("images/halftone2-transparent.png");
  }
}

#brown-areas-low[zoom=10][area>5000000],
#brown-areas-med[zoom=11][area>1000000],
#brown-areas-med[zoom=12][area> 500000],
#brown-areas-med[zoom=12][area> 200000],
#brown-areas-med[zoom=13][area>  75000],
#brown-areas-high[zoom=14][area> 10000],
#brown-areas-high[zoom>14],
{
  polygon-pattern-alignment: global;
  polygon-pattern-file: url("images/halftone2.png");
}

#aeroways {
  line-color: @color_airport_runways;
  line-cap: square;
  line-join: miter;

  [zoom>=15] {
    line-color: @color_airport_runways_detail;
  }

  [type='runway'] {
    [zoom=12] {
      line-width: 2;
    }

    [zoom=13] {
      line-width: 4;
    }

    [zoom=14] {
      line-width: 8;
    }

    [zoom=15] {
      line-width: 16;
    }

    [zoom=16] {
      line-width: 32;
    }

    [zoom=17] {
      line-width: 64;
    }

    [zoom>=18] {
      line-width: 128;
    }
  }

  [type='taxiway'] {
    [zoom=13] {
      line-width: 1;
    }

    [zoom=14] {
      line-width: 2;
    }

    [zoom=15] {
      line-width: 4;
    }

    [zoom=16] {
      line-width: 8;
    }

    [zoom=17] {
      line-width: 16;
    }

    [zoom>=18] {
      line-width: 32;
    }
  }
}

.roads {
  ::casing,
  ::outline,
  {
    line-cap: butt;
    line-width: 0;
    line-color: @color_transport_casing;
  }

  line-join: round;
  line-cap: round;
  line-width: 0;
  line-color: @color_transport;

  [is_tunnel='yes']
  {
    [zoom>=14]
    {
      ::casing {
        line-opacity: 0.5;
      }

      ::outline {
        line-opacity: 0.5;
      }
    }

    [zoom>=15]
    {
      line-opacity: 0; // vs. line-width: 0 to override subsequent styling
    }
  }

  [is_link='yes']
  {
    [zoom>=16]
    {
      ::casing {
        line-width: 8;
      }

      line-width: 4;
    }
  }
}

.roads[kind='highway']
{
  [zoom>=9] {
    ::outline {
      line-width: 4.25;
    }

    line-width: 1.5;
  }

  [zoom>=10] {
    ::outline {
      line-width: 6;
    }

    line-width: 2;
  }

  [zoom>=11] {
    line-width: 2.5;
  }

  [zoom>=12] {
    ::outline {
      line-width: 8;
    }

    line-width: 3;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 0.5;
    }
  }

  [zoom>=13] {
    ::outline {
      line-width: 8;
    }

    line-width: 3;

    [is_link='yes'] {
      ::outline {
        line-width: 3;
      }

      line-width: 1;

      [is_bridge='yes'] {
        ::outline {
          line-width: 3;
        }
      }
    }
  }

  [zoom>=14] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;

    [is_bridge='yes'] {
      ::casing {
        line-width: 8;
      }
    }

    [is_link='yes'] {
      ::outline {
        line-width: 6;
      }

      line-width: 2.5;

      [is_bridge='yes'] {
        ::casing {
          line-width: 6;
        }
      }
    }
  }

  [zoom>=15] {
    ::casing {
      line-width: 11;
    }

    line-width: 6;

    [is_link='yes'] {
      ::casing {
        line-width: 6.5;
      }

      line-width: 2.25;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 5;
        line-opacity: 0.7;
        line-color: @color_transport_tunnel;
      }

      line-width: 3;
      line-opacity: 0.5;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 14;
    }

    line-width: 9;

    [is_link='yes'] {
      ::casing {
        line-width: 7;
      }

      line-width: 2.5;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 7;
        line-opacity: 0.4;
      }

      line-opacity: 0.7;
      line-color: @color_transport_tunnel;

      [is_link='yes'] {
        ::casing {
          line-color: @color_transport_casing;
        }
      }
    }
  }

  [zoom>=17] {
    ::casing {
      line-width: 24;
    }

    line-width: 15;

    [is_link='yes'] {
      ::casing {
        line-width: 9;
      }

      line-width: 5;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 18;
      }

      line-width: 12;

      [is_link='yes'] {
        ::casing {
          line-width: 9;
        }
      }
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 42;
      line-color: @color_transport;
    }

    line-width: 28;
    line-color: @color_transport_inline;

    [is_bridge='yes'] {
      ::casing {
        line-width: 44;
      }
    }

    [is_link='yes'] {
      ::casing {
        line-width: 14;
        line-color: @color_transport;
      }

      line-width: 10;
      line-color: @color_transport_inline;

      [is_bridge='yes'] {
        ::casing {
          line-width: 15;
        }
      }
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 22;
      }

      line-width: 18;
    }
  }

  [zoom>=19] {
    ::casing {
      line-width: 49;
      line-color: @color_transport;
    }

    line-width: 35;
    line-color: @color_transport_casing;

    [is_bridge='yes'] {
      ::casing {
        line-width: 51;
      }
    }

    [is_link='yes'] {
      ::casing {
        line-width: 20;
      }

      line-width: 16;
      line-color: @color_transport_casing;

      [is_bridge='yes'] {
        ::casing {
          line-width: 21;
        }
      }
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 30;
      }

      line-width: 26;

      [is_link='yes'] {
        ::casing {
          line-width: 13;
        }
      }
    }
  }
}

.roads[kind='major_road']
{
  [zoom<=12] {
    line-color: #000;
  }

  [zoom>=9] {
    line-width: 0.15;
  }

  [zoom>=10] {
    line-width: 0.5;
  }

  [zoom>=11] {
    ::outline {
      line-width: 1.25;
    }

    line-width: 0.7;
  }

  [zoom>=12] {
    ::outline {
      line-width: 5;
    }

    line-width: 1;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 0.5;
    }
  }

  [zoom>=13] {
    line-width: 1.5;
  }

  [zoom>=14] {
    ::outline {
      line-width: 6;
    }

    line-width: 1.9;

    [is_bridge='yes'] {
      ::casing {
        line-width: 6;
      }
    }

    [is_link='yes'] {
      ::outline {
        line-width: 6;
      }

      line-width: 1.9;

      [is_bridge='yes'] {
        ::casing {
          line-width: 6;
        }
      }
    }
  }

  [zoom>=15] {
    ::casing {
      line-width: 8;
    }

    line-width: 5;

    [is_link='yes'] {
      ::casing {
        line-width: 5.5;
      }

      line-width: 2.25;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 5;
        line-opacity: 0.7;
        line-color: @color_transport_tunnel;
      }

      line-width: 3;
      line-opacity: 0.5;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 11;
    }

    line-width: 7;

    [is_link='yes'] {
      ::casing {
        line-width: 7;
      }

      line-width: 2.5;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 7;
        line-opacity: 0.4;
      }

      line-opacity: 0.7;
      line-color: @color_transport_tunnel;

      [is_link='yes'] {
        ::casing {
          line-color: @color_transport_casing;
        }
      }
    }
  }

  [zoom>=17] {
    ::casing {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::casing {
        line-width: 8;
      }

      line-width: 4;
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 18;
      }

      line-width: 12;

      [is_link='yes'] {
        ::casing {
          line-width: 9;
        }
      }
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 22;
      line-color: @color_transport;
    }

    line-width: 18;
    line-color: @color_transport_inline;

    [is_bridge='yes'] {
      ::casing {
        line-width: 24;
      }
    }

    [is_link='yes'] {
      ::casing {
        line-width: 13;
        line-color: @color_transport;
      }

      line-width: 9;
      line-color: @color_transport_inline;

      [is_bridge='yes'] {
        ::casing {
          line-width: 14;
        }
      }
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 22;
      }

      line-width: 18;
    }
  }

  [zoom>=19] {
    ::casing {
      line-width: 30;
    }

    line-width: 26;
    line-color: @color_transport_casing;

    [is_bridge='yes'] {
      ::casing {
        line-width: 32;
      }
    }

    [is_link='yes'] {
      ::casing {
        line-width: 17;
      }

      line-width: 13;
      line-color: @color_transport_casing;

      [is_bridge='yes'] {
        ::casing {
          line-width: 18;
        }
      }
    }

    [is_tunnel='yes'] {
      ::casing {
        line-width: 30;
      }

      line-width: 26;

      [is_link='yes'] {
        ::casing {
          line-width: 13;
        }
      }
    }
  }
}

.roads[kind='minor_road']
{
  [zoom<=14] {
    line-color: #999;
  }

  [zoom>=16] {
    line-color: @color_transport_minor;
  }

  [zoom>=10] {
    line-width: 0.2;
  }

  [zoom>=13] {
    line-width: 0.4;
  }

  [zoom>=14] {
    line-width: 0.8;
  }

  [zoom>=15] {
    line-width: 1.5;

    [is_tunnel='yes'] {
      ::casing {
        line-opacity: 0.7;
        line-color: @color_transport_tunnel;
      }

      line-opacity: 0.5;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 7;
    }

    line-width: 4;
    line-color: @color_transport;
  }

  [zoom>=17] {
    ::casing {
      line-width: 9;
    }

    line-width: 7;
  }

  [zoom>=18] {
    ::casing {
      line-width: 17;
      line-color: @color_transport;
    }

    line-width: 13;
    line-color: @color_transport_casing;
  }

  [zoom>=19] {
    ::casing {
      line-width: 20;
    }

    line-width: 16;
  }
}

.roads[kind='rail']
{
  ::casing,
  ::outline,
  {
    line-color: @color_transport_rail;
  }

  line-color: @color_transport_rail;

  [zoom>=14] {
    ::casing {
      line-width: 3;
      line-dasharray: 1,3;
    }

    line-width: 1;
  }

  [zoom>=16] {
    ::casing {
      line-width: 5;
      line-dasharray: 1,4;
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 6;
      line-dasharray: 2,6;
    }

    line-width: 2;
  }

  [zoom>=19] {
    ::casing {
      line-width: 9;
      line-dasharray: 4,7;
    }

    line-width: 4;
  }
}

.roads[highway='service']
{
  [zoom>=15]
  {
    line-width: 1.5;
  }

  [zoom>=16] {
    ::casing {
      line-width: 4;
    }

    line-width: 2;
  }

  [zoom>=17] {
    ::casing {
      line-width: 6;
    }

    line-width: 4;
  }
}

.roads[kind='path']
{
  ::casing {
    line-color: @color_transport_path;
  }

  line-color: @color_transport_casing;

  [zoom>=15] {
    ::casing {
      line-width: 4;
    }

    line-width: 1.5;
    line-cap: butt;
  }

  [zoom>=16] {
    ::casing {
      line-width: 5;
    }

    line-width: 2;
  }

  [zoom>=17] {
    line-width: 3;
  }

  [zoom>=19] {
    line-width: 4;
  }
}


