BEGIN;

TRUNCATE TABLE pr_occtax.t_releves_occtax CASCADE;
ALTER SEQUENCE pr_occtax.t_releves_occtax_id_releve_occtax_seq RESTART WITH 1;
ALTER SEQUENCE pr_occtax.t_occurrences_occtax_id_occurrence_occtax_seq RESTART WITH 1;
ALTER SEQUENCE pr_occtax.cor_counting_occtax_id_counting_occtax_seq RESTART WITH 1;
--delete from gn_permissions.t_permissions where created_on>'2025-10-10 18:00:00';
TRUNCATE TABLE gn_synthese.synthese CASCADE;
ALTER SEQUENCE gn_synthese.synthese_id_synthese_seq RESTART WITH 1;
TRUNCATE TABLE gn_commons.t_validations CASCADE;
ALTER SEQUENCE gn_commons.t_validations_id_validation_seq RESTART WITH 1;

\echo '----------------------------------------------------------------------------'
\echo 'COMMIT if all is ok:'
COMMIT;

