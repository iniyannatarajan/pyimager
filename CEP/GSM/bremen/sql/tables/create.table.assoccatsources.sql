/**
 * This table stores the information about the sources that
 * could be associated.
 * src_type:        Either 'X' or 'C', for associations
 *                  in extractedsources or catalogedsources
 * xrtsrc_id:       This is the xtrsrcid that corresponds to the
 *                  first detection
 * assoc_xtrsrcid:  This is the id of the source that could be
 *                  associated to a previously detection
 *                  (corresponding to assoc_xtrsrcid)
 * assoc_lr_method  The applied method to determine the likelihood ratio
 *          (0)     default, no method applied
 *          (1)     de Ruiter
 *          (2)     Rutledge
 *          (3)     Rutledge/Masci
 *          (4)     Sutherland & Saunders (1992)
 *          (5)     TKP (see doc)
 */
--CREATE SEQUENCE "seq_assoccatsources" AS INTEGER;

CREATE TABLE assoccatsources
  (xtrsrc_id INT NOT NULL
  ,catsrc_id INT NOT NULL
  ,assoc_weight double NULL
  ,assoc_distance_arcsec double NULL
  ,assoc_lr_method INT NULL DEFAULT 0
  ,assoc_r double NULL
  ,assoc_loglr double NULL
  )
;

