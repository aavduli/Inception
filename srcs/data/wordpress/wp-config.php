<?php
define('DB_NAME', getenv('MARIADB_DATABASE'));
define('DB_USER', getenv('MARIADB_USER'));
define('DB_PASSWORD', getenv('MARIADB_PASSWORD'));
define('DB_HOST', 'mariadb:3306');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'k;mEwmSw2(8r;+X9+)$XVJ_r0Ft7jy9-jAX+a%U7gDAeG7E&m$4(!K@(az^WnDvI');
define('SECURE_AUTH_KEY',  'bMw~MqWKPTZyp{tP$] DPu@kpCHO0%77y SumxrhIkHb,Z.R-fAhNDAIB5+I>r ;');
define('LOGGED_IN_KEY',    'b9HjLR-UuY0hI^:>&O.085TQJR_1pSDW07&pF7j>iY& D<39k^H]1;r[,J/B+aq|');
define('NONCE_KEY',        'KaQ(vPT|=fS< 2a[md<N43=:.OAi;Uts{B>HFNH&f@%|W:]J5n<D|$05QM(b+PgT');
define('AUTH_SALT',        'bV{.#%ouf~`;@u|KGf#[|P]0lKziB8r2JZ[wNb~m,F,9+H6kl6,0M+L|[v+Fe3EP');
define('SECURE_AUTH_SALT', 'boqthgW51/|fo?X&io8Kez(| }i}RyL>)sqhYP-0Yt=}Z.i)1orPNI9EiJS37<PV');
define('LOGGED_IN_SALT',   'm*|@#{:<7Ti+T#i@,_}%3[ Lg$iLgM.r~9M^Im_vR]w* -nNR_|C|@$K-3ho+C+a');
define('NONCE_SALT',       '&{ew<_In#g<4L 8iR[[DmE>_+OE$|J+xa$ZS}rXR5S;w+;AbU+jph,tX>6]DZ7,W');

$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH')) define('ABSPATH', dirname(_FILE__) . '/');
require_once('ABSPATH' . 'wp-settings.php');
