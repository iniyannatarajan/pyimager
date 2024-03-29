--frequencybands
COMMENT ON COLUMN frequencybands.freq_central is 'Band middle frequency (Hz)';
COMMENT ON COLUMN frequencybands.freq_low is 'Band lower limit frequency (Hz)';
COMMENT ON COLUMN frequencybands.freq_high is 'Band upper limit frequency (Hz)';
--runs
COMMENT ON COLUMN runs.runid is '';
COMMENT ON COLUMN runs.start_date is 'Time of run begin' ;
COMMENT ON COLUMN runs.end_date is 'Time of run end';
COMMENT ON COLUMN runs.status is 'Run status (...)';
COMMENT ON COLUMN runs.user_id is 'User who started a run ';
COMMENT ON COLUMN runs.process_id is 'System process id';
--images
COMMENT ON COLUMN images.imageid is '';
COMMENT ON COLUMN images.ds_id is '';
COMMENT ON COLUMN images.tau is '';
COMMENT ON COLUMN images.band is 'Frequency band';
COMMENT ON COLUMN images.stokes is 'One of IQUV';
COMMENT ON COLUMN images.imagename is 'LOFAR image ID';
COMMENT ON COLUMN images.centr_ra is 'Pointing ra (degrees)';
COMMENT ON COLUMN images.centr_decl is 'Pointing decl (degrees)';
COMMENT ON COLUMN images.fov_radius is 'Field of view (degrees)';
COMMENT ON COLUMN images.bmaj is 'Beam major axis (degrees)';
COMMENT ON COLUMN images.bmin is 'Beam minor axis (degrees)';
COMMENT ON COLUMN images.bpa is 'Beam pitch angle (degrees)';
COMMENT ON COLUMN images.url is 'Image file name';
COMMENT ON COLUMN images.reprocessing is 'Number of reprocessings of this image';
COMMENT ON COLUMN images.status is 'Image status (...)';
COMMENT ON COLUMN images.process_date is 'Last image processing date';
COMMENT ON COLUMN images.svn_version is 'SVN version of the pipeline of the last processing';
COMMENT ON COLUMN images.run_id is '';
--extractedsources
COMMENT ON COLUMN extractedsources.xtrsrcid is '';
COMMENT ON COLUMN extractedsources.xtrsrcid2 is 'Reference to xtrsrcid for sources mirrored across 360-degrees';
COMMENT ON COLUMN extractedsources.image_id is '';
COMMENT ON COLUMN extractedsources.zone is 'integer part of decl';
COMMENT ON COLUMN extractedsources.healpix_zone is 'Zone of HEALpix division';
COMMENT ON COLUMN extractedsources.ra is 'right ascention (degrees)';
COMMENT ON COLUMN extractedsources.decl is 'declination (degrees)';
COMMENT ON COLUMN extractedsources.ra_err is 'error of ra';
COMMENT ON COLUMN extractedsources.decl_err is 'error of decl';
COMMENT ON COLUMN extractedsources.x is 'x-coordinate on 3D unit sphere';
COMMENT ON COLUMN extractedsources.y is 'y-coordinate on 3D unit sphere';
COMMENT ON COLUMN extractedsources.z is 'z-coordinate on 3D unit sphere';
COMMENT ON COLUMN extractedsources.det_sigma is 'detection threshold';
COMMENT ON COLUMN extractedsources.source_kind is '0=point source, 1=extended source';
COMMENT ON COLUMN extractedsources.g_major is 'major axis for extended source';
COMMENT ON COLUMN extractedsources.g_major_err is 'error of major axis for extended source';
COMMENT ON COLUMN extractedsources.g_minor is 'minor axis for extended source';
COMMENT ON COLUMN extractedsources.g_minor_err is 'error of minor axis for extended source';
COMMENT ON COLUMN extractedsources.g_pa is 'positional angle for extended source';
COMMENT ON COLUMN extractedsources.g_pa_err is 'error of positional angle for extended source';
COMMENT ON COLUMN extractedsources.f_peak is 'Peak flux';
COMMENT ON COLUMN extractedsources.f_peak_err is 'Peak flux error';
COMMENT ON COLUMN extractedsources.f_int is 'Integrated flux';
COMMENT ON COLUMN extractedsources.f_int_err is 'Integrated flux error';
--assocxtrsources
COMMENT ON COLUMN assocxtrsources.xtrsrc_id is 'Reference to extractedsources';
COMMENT ON COLUMN assocxtrsources.runcat_id is 'Reference to runningcatalog';
COMMENT ON COLUMN assocxtrsources.weight is 'Association weight';
COMMENT ON COLUMN assocxtrsources.distance_arcsec is 'Distance in arcseconds';
COMMENT ON COLUMN assocxtrsources.lr_method is '';
COMMENT ON COLUMN assocxtrsources.r is 'de Ruiter distance';
COMMENT ON COLUMN assocxtrsources.lr is '';

--runningcatalog
COMMENT ON COLUMN runningcatalog.runcatid is '';
COMMENT ON COLUMN runningcatalog.first_xtrsrc_id is 'Id of the first observation';
COMMENT ON COLUMN runningcatalog.ds_id is '';
COMMENT ON COLUMN runningcatalog.band is 'Frequency band for per-band extended source';
COMMENT ON COLUMN runningcatalog.stokes is 'Stokes parameter for per-band extended source';
COMMENT ON COLUMN runningcatalog.datapoints is 'Number of observations';
COMMENT ON COLUMN runningcatalog.decl_zone is 'integer part of decl';
COMMENT ON COLUMN runningcatalog.healpix_zone is 'Zone of HEALpix division';
COMMENT ON COLUMN runningcatalog.wm_ra is '';
COMMENT ON COLUMN runningcatalog.wm_ra_err is '';
COMMENT ON COLUMN runningcatalog.avg_wra is '';
COMMENT ON COLUMN runningcatalog.avg_weight_ra is '';
COMMENT ON COLUMN runningcatalog.wm_decl is '';
COMMENT ON COLUMN runningcatalog.wm_decl_err is '';
COMMENT ON COLUMN runningcatalog.avg_wdecl is '';
COMMENT ON COLUMN runningcatalog.avg_weight_decl is '';
COMMENT ON COLUMN runningcatalog.source_kind is '0=point source, 1=extended source';
COMMENT ON COLUMN runningcatalog.parent_runcat_id is 'Id of the cross-band source for per-band extendedsource';
COMMENT ON COLUMN runningcatalog.wm_g_minor is '';
COMMENT ON COLUMN runningcatalog.wm_g_minor_err is '';
COMMENT ON COLUMN runningcatalog.avg_wg_minor is '';
COMMENT ON COLUMN runningcatalog.avg_weight_g_minor is '';
COMMENT ON COLUMN runningcatalog.wm_g_major is '';
COMMENT ON COLUMN runningcatalog.wm_g_major_err is '';
COMMENT ON COLUMN runningcatalog.avg_wg_major is '';
COMMENT ON COLUMN runningcatalog.avg_weight_g_major is '';
COMMENT ON COLUMN runningcatalog.wm_g_pa is '';
COMMENT ON COLUMN runningcatalog.wm_g_pa_err is '';
COMMENT ON COLUMN runningcatalog.avg_wg_pa is '';
COMMENT ON COLUMN runningcatalog.avg_weight_g_pa is '';
COMMENT ON COLUMN runningcatalog.is_group is 'True if a source belongs to a group ';
COMMENT ON COLUMN runningcatalog.group_head_id is 'Group ID';
COMMENT ON COLUMN runningcatalog.deleted is 'True if this source was deleted';
COMMENT ON COLUMN runningcatalog.last_update_date is 'Date of the last source update';
COMMENT ON COLUMN runningcatalog.x is 'x-coordinate on 3D unit sphere';
COMMENT ON COLUMN runningcatalog.y is 'y-coordinate on 3D unit sphere';
COMMENT ON COLUMN runningcatalog.z is 'z-coordinate on 3D unit sphere';
COMMENT ON COLUMN runningcatalog.last_spectra_update_date is 'Date of the last spectral fitting';
COMMENT ON COLUMN runningcatalog.spectral_power is 'Order of polinomial fit';
COMMENT ON COLUMN runningcatalog.spectral_index_0 is 'Polinomial fit coefficients';
COMMENT ON COLUMN runningcatalog.spectral_index_1 is '';
COMMENT ON COLUMN runningcatalog.spectral_index_2 is '';
COMMENT ON COLUMN runningcatalog.spectral_index_3 is '';
COMMENT ON COLUMN runningcatalog.spectral_index_4 is '';
--runningcatalog_fluxes
COMMENT ON COLUMN runningcatalog_fluxes.runcat_id is 'Reference to runningcatalog';
COMMENT ON COLUMN runningcatalog_fluxes.band is 'Frequency band';
COMMENT ON COLUMN runningcatalog_fluxes.stokes is 'Stokes parameter';
COMMENT ON COLUMN runningcatalog_fluxes.datapoints is 'Number of observations';
COMMENT ON COLUMN runningcatalog_fluxes.wm_f_peak is 'Peak flux';
COMMENT ON COLUMN runningcatalog_fluxes.wm_f_peak_err is '';
COMMENT ON COLUMN runningcatalog_fluxes.avg_wf_peak is '';
COMMENT ON COLUMN runningcatalog_fluxes.avg_weight_f_peak is '';
COMMENT ON COLUMN runningcatalog_fluxes.wm_f_int is 'Integrated flux';
COMMENT ON COLUMN runningcatalog_fluxes.wm_f_int_err is '';
COMMENT ON COLUMN runningcatalog_fluxes.avg_wf_int is '';
COMMENT ON COLUMN runningcatalog_fluxes.avg_weight_f_int is '';
--temp_associations
COMMENT ON COLUMN temp_associations.xtrsrc_id is '';
COMMENT ON COLUMN temp_associations.xtrsrc_id2 is '';
COMMENT ON COLUMN temp_associations.runcat_id is '';
COMMENT ON COLUMN temp_associations.distance_arcsec is '';
COMMENT ON COLUMN temp_associations.lr_method is '';
COMMENT ON COLUMN temp_associations.r is '';
COMMENT ON COLUMN temp_associations.lr is '';
COMMENT ON COLUMN temp_associations.xtr_count is '';
COMMENT ON COLUMN temp_associations.run_count is '';
COMMENT ON COLUMN temp_associations.kind is '';
COMMENT ON COLUMN temp_associations.group_head_id is '';
COMMENT ON COLUMN temp_associations.flux_fraction is '';
COMMENT ON COLUMN temp_associations.image_id is '';
--image_stats
COMMENT ON COLUMN image_stats.image_id is '';
COMMENT ON COLUMN image_stats.run_id is '';
COMMENT ON COLUMN image_stats.kind is '';
COMMENT ON COLUMN image_stats.lr_method is '';
COMMENT ON COLUMN image_stats.value is '';
