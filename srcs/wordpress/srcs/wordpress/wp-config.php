<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'HqDvQY2BikM' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'G9+t8@u9$,ojA4lDT#J^|+v)n;,9tcaxSY5A{b<!`)[[z+ohAgd|`ynY8F9c?@8A');
define('SECURE_AUTH_KEY',  'Njay|Fd.Ff,Qf@^4%<dxYmDz2R*VDp%2Y]6S8|W07P3r6vE/L<$Zf? L/MB+!C+r');
define('LOGGED_IN_KEY',    'H -<JgA=;Si|9bhhUIu^2OI~>5Ba)5#!- u4j]K:l)O!sAGP`MTWhRC}r|sZ>l{3');
define('NONCE_KEY',        '/{W8Ks1`Ty/h/E #N+BJQ I3=d)/G1C}?AXm4H|l-T=R@RP#dtHds-r11^)yUv-L');
define('AUTH_SALT',        'tfr=_U)VUJG{)$7^yKYHqw@*>:+R41/Llc4>PnDx2NGw=s|~Gcs(&B^{JD%VO|vW');
define('SECURE_AUTH_SALT', '{RoYxjpcKgA:zu)X6e.)q>x-nhS|^-cX3}I(gPHXk/[5)_(U 3,&rL6Q ,Ej}Yyc');
define('LOGGED_IN_SALT',   'iCeR%q=FUyj9 ox6Xgy[;WY|nf]QvE[9{;2`Q|RKCBX6*>%|7TP~5H<])uQ?HEHM');
define('NONCE_SALT',       '.aeETf?N(+ReIMy[]O{$(A]<-WAeG:~Vr]l.|L,(ING`c-WHq:)dz#gE-PXUtJa&');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
