create_library_set -name worst_libs -timing "/opt/PDKs/SAED32nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib /opt/PDKs/SAED32nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib /opt/PDKs/SAED32nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_pg_ss0p95vn40c.lib"
create_rc_corner -name cmax -T -40 -cap_table ../../../../libs/SAED32nm/cadence_cap_tech/saed32nm_1p9m_Cmax.cap -qrc_tech ../../../../libs/SAED32nm/cadence_cap_tech/tech.lef
create_rc_corner -name cmin -T -40 -cap_table ../../../../libs/SAED32nm/cadence_cap_tech/saed32nm_1p9m_Cmin.cap -qrc_tech ../../../../libs/SAED32nm/cadence_cap_tech/tech.lef
create_constraint_mode -name const_mode -sdc_files "../constraints/top.sdc"
create_timing_condition -name tc_worst -library_sets worst_libs
create_delay_corner -name worst_corner -timing_condition tc_worst -rc_corner cmax
create_timing_condition -name tc_best -library_sets worst_libs
create_delay_corner -name best_corner -timing_condition tc_best -rc_corner cmin
create_analysis_view -name func_worst_scenario -delay_corner worst_corner -constraint_mode const_mode
create_analysis_view -name func_best_scenario -delay_corner best_corner -constraint_mode const_mode
set_analysis_view -setup func_worst_scenario -hold func_best_scenario
