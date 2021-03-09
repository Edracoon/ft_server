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
define( 'DB_USER', 'epfennig' );

/** MySQL database password */
define( 'DB_PASSWORD', 'mdp' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '`p+al,j+LdXne N^%n[zf}5C?<lq#8f]eSA=e0,*|g6w |;MQ*AypyzmXSgJFx]g' );
define( 'SECURE_AUTH_KEY',  '7oV P76lzhQ.+ACi?(cv{b|>`9qMGNH7z;|+DY+9QrkxF=7L*,3FQ-If%xZ_#No3' );
define( 'LOGGED_IN_KEY',    'v|cm-vCeRx5tPNfkX{J5yo;3m+P;|roRRd`` `az-daEcs@6;;5r|ZW Pb16yF(&' );
define( 'NONCE_KEY',        '>xP-G-&.nqG:Mx0Ox8V:gbG.y#Wqo!H^G+A{qP`Zgg#$;s JVi3}s}u6=^PSY/C>' );
define( 'AUTH_SALT',        '|E{:S,.DXD)X30fm6]{X=TG9=43z:UcdM#HL4Z&mHQwq?kDM!I%zuLAtkl-.(fC>' );
define( 'SECURE_AUTH_SALT', '#+%*|m|:y.eQ4HePz*M7E cptL4>&mC[NVrp2]vj&X~}d7r$S=Y~|{~^VF$tQ2:w' );
define( 'LOGGED_IN_SALT',   'gvPaPJ@_pZw;t< |07)^U8(yUaD]0+|s86{b$e:t`jAP8&>WCQID^Q3aF@m-r1KC' );
define( 'NONCE_SALT',       'cT0CMoMKr5oHdSo:khmx;V:2!h~8ieM0/XI[a Z4.pE1hXI<fQ4[YX$)Y/YEdK(R' );

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
