--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.associated_policy VALUES ('55ce25a3-4655-46ea-8790-1968de43c309', '7648380b-8d5f-4be4-8e38-3b6bbb5c1357');
INSERT INTO public.associated_policy VALUES ('ad64bd4c-c875-42e5-934a-c2047a6b1cbd', '0f3e6cab-2f44-4dd8-89cb-5b9b4c5945dc');
INSERT INTO public.associated_policy VALUES ('1df07291-6f76-4912-b537-57b6101794f5', '6b192cd8-a7ab-4f00-ae63-6872a7d9672e');


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authentication_execution VALUES ('a834de15-3da6-44cc-a950-2582b9447465', NULL, 'auth-cookie', 'master', 'e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('182b4875-5d92-4048-a304-89b4e67f0156', NULL, 'auth-spnego', 'master', 'e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('95655b68-0096-4c55-a0e1-c97cca5ce712', NULL, 'identity-provider-redirector', 'master', 'e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('39d67d59-e6cf-4d84-af1a-0033ec10b4e1', NULL, NULL, 'master', 'e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 2, 30, true, '84e6c2af-bf4d-455d-a84a-a11db79cee97', NULL);
INSERT INTO public.authentication_execution VALUES ('ded69949-1088-4dfc-84a6-7676084d57e0', NULL, 'auth-username-password-form', 'master', '84e6c2af-bf4d-455d-a84a-a11db79cee97', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4fe78a15-6989-43d5-88ec-5738aa2cc9b7', NULL, NULL, 'master', '84e6c2af-bf4d-455d-a84a-a11db79cee97', 1, 20, true, '6d27669e-bed1-470a-a40e-6d72aa69b23c', NULL);
INSERT INTO public.authentication_execution VALUES ('b3416f0c-6ca0-4cd7-ac3f-58f73ddf5834', NULL, 'conditional-user-configured', 'master', '6d27669e-bed1-470a-a40e-6d72aa69b23c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('36c2a4ce-a047-4649-b30e-dd5114f7b562', NULL, 'auth-otp-form', 'master', '6d27669e-bed1-470a-a40e-6d72aa69b23c', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('feac5127-6043-4378-af4c-a39bef96e421', NULL, 'direct-grant-validate-username', 'master', '4b233f33-8b76-48c3-9cd2-c13bc4e8049a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cebab8c3-f813-40ee-b84e-07222f2f893b', NULL, 'direct-grant-validate-password', 'master', '4b233f33-8b76-48c3-9cd2-c13bc4e8049a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('523f1642-a633-4863-8ce9-f385e0d80a08', NULL, NULL, 'master', '4b233f33-8b76-48c3-9cd2-c13bc4e8049a', 1, 30, true, 'fa282cb4-255c-4476-bf49-bb27dd5f8ebd', NULL);
INSERT INTO public.authentication_execution VALUES ('b91b6cbd-f95d-4194-aac9-83298ee2aa52', NULL, 'conditional-user-configured', 'master', 'fa282cb4-255c-4476-bf49-bb27dd5f8ebd', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7d4063fd-3895-4fa9-83f0-e4804f4f8bd6', NULL, 'direct-grant-validate-otp', 'master', 'fa282cb4-255c-4476-bf49-bb27dd5f8ebd', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3a925a51-10ed-472d-af1c-6b752c5f93ba', NULL, 'registration-page-form', 'master', 'cde407a2-b40e-4622-837a-2f878ebcfd21', 0, 10, true, '8daa9435-f0ed-4697-ae88-9b5d97fb62fd', NULL);
INSERT INTO public.authentication_execution VALUES ('43e5c0c8-1db3-46e5-b1ae-79c7ebff30e5', NULL, 'registration-user-creation', 'master', '8daa9435-f0ed-4697-ae88-9b5d97fb62fd', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('38999172-819d-4612-bc7e-d0358622ac81', NULL, 'registration-profile-action', 'master', '8daa9435-f0ed-4697-ae88-9b5d97fb62fd', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e5fef81a-7780-4ad1-851e-35076c4df2c0', NULL, 'registration-password-action', 'master', '8daa9435-f0ed-4697-ae88-9b5d97fb62fd', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bd579f1f-38dd-4fb4-8ec6-668d8b88e43f', NULL, 'registration-recaptcha-action', 'master', '8daa9435-f0ed-4697-ae88-9b5d97fb62fd', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6fd0655f-9fdf-4719-905a-84359877dfeb', NULL, 'reset-credentials-choose-user', 'master', '55cca2aa-a766-4f62-abf1-3668615e78cc', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('144c45ee-28aa-4369-a01e-f1ac53f12d4a', NULL, 'reset-credential-email', 'master', '55cca2aa-a766-4f62-abf1-3668615e78cc', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('695cf6f3-e4b8-43b2-9a13-b79eb07d9a6f', NULL, 'reset-password', 'master', '55cca2aa-a766-4f62-abf1-3668615e78cc', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f71456b5-85c4-4d0a-8c96-a48dfedae44a', NULL, NULL, 'master', '55cca2aa-a766-4f62-abf1-3668615e78cc', 1, 40, true, '034f4f69-d9d8-4b44-9cb5-201db0f745f2', NULL);
INSERT INTO public.authentication_execution VALUES ('690c0224-6555-4b0b-8d96-8726902d25a9', NULL, 'conditional-user-configured', 'master', '034f4f69-d9d8-4b44-9cb5-201db0f745f2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('79725f34-b6f8-433f-aab3-5c4bc606be22', NULL, 'reset-otp', 'master', '034f4f69-d9d8-4b44-9cb5-201db0f745f2', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('99e7cb4c-530e-4901-9d37-1de29af90127', NULL, 'client-secret', 'master', '45017b66-884b-4ff8-a839-cc1600f6255d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c6e96743-ec5b-4308-ab4f-7a14cc9220c2', NULL, 'client-jwt', 'master', '45017b66-884b-4ff8-a839-cc1600f6255d', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1ee856ab-e08a-4bde-a7ef-c7a5971cea34', NULL, 'client-secret-jwt', 'master', '45017b66-884b-4ff8-a839-cc1600f6255d', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c5bd3461-32af-4e57-abd6-57e561b660bf', NULL, 'client-x509', 'master', '45017b66-884b-4ff8-a839-cc1600f6255d', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('29ba946e-6569-4716-9832-c34ce70c3bde', NULL, 'idp-review-profile', 'master', '10b16c62-51fb-43fa-bc41-8ec3cfd93850', 0, 10, false, NULL, '997bcde4-af16-45a3-b457-4be23a8ffc66');
INSERT INTO public.authentication_execution VALUES ('27c71e4d-e377-4dd4-9c13-a43d3e1971dd', NULL, NULL, 'master', '10b16c62-51fb-43fa-bc41-8ec3cfd93850', 0, 20, true, '024dbb88-b40a-43e3-933d-b9df9fbec266', NULL);
INSERT INTO public.authentication_execution VALUES ('317e3fd2-1577-43c0-a4c5-19b755455c86', NULL, 'idp-create-user-if-unique', 'master', '024dbb88-b40a-43e3-933d-b9df9fbec266', 2, 10, false, NULL, '4957de23-3a72-42ac-84fa-a18dfb9afb8e');
INSERT INTO public.authentication_execution VALUES ('1acaa092-f39b-402d-8aa6-38be7ef2c7b0', NULL, NULL, 'master', '024dbb88-b40a-43e3-933d-b9df9fbec266', 2, 20, true, '3fa8303a-90d4-4da1-9c7e-b5833ebe37d5', NULL);
INSERT INTO public.authentication_execution VALUES ('3a507d18-75c7-4884-94c5-f23a94fb5085', NULL, 'idp-confirm-link', 'master', '3fa8303a-90d4-4da1-9c7e-b5833ebe37d5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d152251b-1541-426f-9b7f-0f012670e804', NULL, NULL, 'master', '3fa8303a-90d4-4da1-9c7e-b5833ebe37d5', 0, 20, true, 'f92c399a-edc3-4d58-8923-62dbb41459aa', NULL);
INSERT INTO public.authentication_execution VALUES ('55f8c68a-db2b-4a8d-a3f0-ff6b679541f5', NULL, 'idp-email-verification', 'master', 'f92c399a-edc3-4d58-8923-62dbb41459aa', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c46e17e4-835e-4991-9221-78ad4e79abca', NULL, NULL, 'master', 'f92c399a-edc3-4d58-8923-62dbb41459aa', 2, 20, true, '2261c837-0e2b-4da6-81ae-691975666494', NULL);
INSERT INTO public.authentication_execution VALUES ('e0e39f16-623d-4d1a-8f6b-09d964d0b25a', NULL, 'idp-username-password-form', 'master', '2261c837-0e2b-4da6-81ae-691975666494', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5350aa1d-3691-4bb6-8285-5a5ba07cea9e', NULL, NULL, 'master', '2261c837-0e2b-4da6-81ae-691975666494', 1, 20, true, '60fdd950-4aef-4ef2-992a-0156b2d05b65', NULL);
INSERT INTO public.authentication_execution VALUES ('2893e680-ea1c-495b-8b8a-fa59674833e9', NULL, 'conditional-user-configured', 'master', '60fdd950-4aef-4ef2-992a-0156b2d05b65', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b377bf16-2330-4492-b5dd-06e733280e38', NULL, 'auth-otp-form', 'master', '60fdd950-4aef-4ef2-992a-0156b2d05b65', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6cb5887f-ee8d-4e6c-882e-8c4aecbc3de1', NULL, 'http-basic-authenticator', 'master', '4d522d12-dce0-48ba-8bc6-f240dbfbaeb5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f81cd9ef-67fd-4166-92ef-974c955f7841', NULL, 'docker-http-basic-authenticator', 'master', '53989273-1267-4c56-b4d9-411956c872dc', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('53139009-0637-4733-bc96-37afa6a57cca', NULL, 'no-cookie-redirect', 'master', '3672984b-6cc5-44f5-895a-cc1f95289d86', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9bf9bef5-d486-41f8-97f8-ded1939584af', NULL, NULL, 'master', '3672984b-6cc5-44f5-895a-cc1f95289d86', 0, 20, true, '0b0e6067-2ce4-41b7-b491-1ee61cec2d66', NULL);
INSERT INTO public.authentication_execution VALUES ('c7fe26b8-35e2-4293-9d38-9973ca8d2ea5', NULL, 'basic-auth', 'master', '0b0e6067-2ce4-41b7-b491-1ee61cec2d66', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('265a5556-75b5-447f-9760-87c55e22bdc2', NULL, 'basic-auth-otp', 'master', '0b0e6067-2ce4-41b7-b491-1ee61cec2d66', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f0dda866-57a0-453c-ba23-b071722760a5', NULL, 'auth-spnego', 'master', '0b0e6067-2ce4-41b7-b491-1ee61cec2d66', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4956e7a2-b09a-4849-9f70-3df8a120f648', NULL, 'auth-cookie', 'FRONT', '77a905ee-a1f6-4c22-a891-057d5c1aaf50', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8cd07d63-8f08-4c42-9f5a-aa4296b03a62', NULL, 'auth-spnego', 'FRONT', '77a905ee-a1f6-4c22-a891-057d5c1aaf50', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('401743de-e462-441c-866f-d1b9f4c59590', NULL, 'identity-provider-redirector', 'FRONT', '77a905ee-a1f6-4c22-a891-057d5c1aaf50', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('65c2c1f6-efd8-4e1c-b166-5408cc7f7eb3', NULL, NULL, 'FRONT', '77a905ee-a1f6-4c22-a891-057d5c1aaf50', 2, 30, true, 'fe918877-9137-48f1-9007-118e423b44d0', NULL);
INSERT INTO public.authentication_execution VALUES ('36a5e06c-811c-4ed3-b51b-5d7fc03b048b', NULL, 'auth-username-password-form', 'FRONT', 'fe918877-9137-48f1-9007-118e423b44d0', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('80672af1-ebb7-4762-8479-1781ee8c5b6f', NULL, NULL, 'FRONT', 'fe918877-9137-48f1-9007-118e423b44d0', 1, 20, true, 'ce890549-e5d1-4d68-9274-4160e855707b', NULL);
INSERT INTO public.authentication_execution VALUES ('b70cb391-0e62-4539-b4e6-1a2a63eed8ff', NULL, 'conditional-user-configured', 'FRONT', 'ce890549-e5d1-4d68-9274-4160e855707b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('57b06e5b-be86-4e04-b404-e2dfdb142a58', NULL, 'auth-otp-form', 'FRONT', 'ce890549-e5d1-4d68-9274-4160e855707b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('31296f4a-1a5a-4789-9c86-d7a94bf2d9cd', NULL, 'direct-grant-validate-username', 'FRONT', '800bcba7-6b80-4747-8a89-278ac11beb14', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8e957388-8c63-44a5-8fa8-b3055e7ed3e1', NULL, 'direct-grant-validate-password', 'FRONT', '800bcba7-6b80-4747-8a89-278ac11beb14', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('572348d9-18b6-4c9a-9912-69518105790a', NULL, NULL, 'FRONT', '800bcba7-6b80-4747-8a89-278ac11beb14', 1, 30, true, '4164cb91-fa06-4f07-9c63-a224ed6f0c8c', NULL);
INSERT INTO public.authentication_execution VALUES ('e2ee2494-d116-498b-a7f5-1e2406126b56', NULL, 'conditional-user-configured', 'FRONT', '4164cb91-fa06-4f07-9c63-a224ed6f0c8c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('18e48c69-160f-49d0-8002-62d8cb7a104d', NULL, 'direct-grant-validate-otp', 'FRONT', '4164cb91-fa06-4f07-9c63-a224ed6f0c8c', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8ab3807a-e0ca-454c-a7cb-d9224ae8df4e', NULL, 'registration-page-form', 'FRONT', '995d8bbd-7e57-45aa-ac5e-897778f2c106', 0, 10, true, 'ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', NULL);
INSERT INTO public.authentication_execution VALUES ('4eb7960e-5c33-4964-9b6b-028c14dca889', NULL, 'registration-user-creation', 'FRONT', 'ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ca4ad515-59f3-4d75-9423-d168c508cb91', NULL, 'registration-profile-action', 'FRONT', 'ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fb8b14a0-c9e5-4afd-b70a-d9bb82ad6414', NULL, 'registration-password-action', 'FRONT', 'ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1834bc37-5db3-479b-9fa0-07c956617eb2', NULL, 'registration-recaptcha-action', 'FRONT', 'ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3356f6ec-f259-4b51-bc38-7c2ee1db77c8', NULL, 'reset-credentials-choose-user', 'FRONT', '2ddb73a1-7125-4558-bf44-e4d994de73ed', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1d0032d5-446a-41d9-9910-c8ac93bd63b3', NULL, 'reset-credential-email', 'FRONT', '2ddb73a1-7125-4558-bf44-e4d994de73ed', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2bd853c9-75f3-4c5c-97c0-9142fa0fba71', NULL, 'reset-password', 'FRONT', '2ddb73a1-7125-4558-bf44-e4d994de73ed', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('947a9b26-0821-473f-a985-bfa010bfa359', NULL, NULL, 'FRONT', '2ddb73a1-7125-4558-bf44-e4d994de73ed', 1, 40, true, 'e454bfd4-4df4-406e-97c9-89d45727d83b', NULL);
INSERT INTO public.authentication_execution VALUES ('a2838845-16ca-42fc-b33c-65d3e0053246', NULL, 'conditional-user-configured', 'FRONT', 'e454bfd4-4df4-406e-97c9-89d45727d83b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3ffad486-e546-4401-ae7c-aa5b056bfbc0', NULL, 'reset-otp', 'FRONT', 'e454bfd4-4df4-406e-97c9-89d45727d83b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7cda5956-8b9f-45a2-be4f-2c77443028f8', NULL, 'client-secret', 'FRONT', '2a699451-16ae-48a0-bd55-d7273d571d29', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7c548a55-a7d4-43f0-831c-f4bd8404761e', NULL, 'client-jwt', 'FRONT', '2a699451-16ae-48a0-bd55-d7273d571d29', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1f479858-bd3d-47ce-9a95-2e22139a9393', NULL, 'client-secret-jwt', 'FRONT', '2a699451-16ae-48a0-bd55-d7273d571d29', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bc110e16-620a-444c-91c3-51a419b6884d', NULL, 'client-x509', 'FRONT', '2a699451-16ae-48a0-bd55-d7273d571d29', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b52960ac-9f93-40be-8eff-90b591b11fbd', NULL, 'idp-review-profile', 'FRONT', '52386ea4-f957-4c5c-aa47-f4f2d8da89e8', 0, 10, false, NULL, 'ccae57da-d73a-4188-9487-4e6967d672f6');
INSERT INTO public.authentication_execution VALUES ('85f04c38-e785-432d-ae72-1e5c3e9bfa53', NULL, NULL, 'FRONT', '52386ea4-f957-4c5c-aa47-f4f2d8da89e8', 0, 20, true, 'd487c333-24ad-42ee-9b9c-6ce1e8f07f2a', NULL);
INSERT INTO public.authentication_execution VALUES ('21c2edd5-33ed-4b0e-b2b1-ca2f445c98e0', NULL, 'idp-create-user-if-unique', 'FRONT', 'd487c333-24ad-42ee-9b9c-6ce1e8f07f2a', 2, 10, false, NULL, '61a7a6e9-ac4e-4e00-ad47-9d8b7f00c03a');
INSERT INTO public.authentication_execution VALUES ('e12e8364-4518-423d-92ce-41bcc8dfea1f', NULL, NULL, 'FRONT', 'd487c333-24ad-42ee-9b9c-6ce1e8f07f2a', 2, 20, true, '35887902-7404-4b30-99be-058fb52a1576', NULL);
INSERT INTO public.authentication_execution VALUES ('7fb9a7ad-6172-46a1-80e6-63408490e645', NULL, 'idp-confirm-link', 'FRONT', '35887902-7404-4b30-99be-058fb52a1576', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3399b29d-6f64-46a0-aba8-4861dd1f108d', NULL, NULL, 'FRONT', '35887902-7404-4b30-99be-058fb52a1576', 0, 20, true, '18c98d08-d786-4ba3-b303-0e286d8efeb4', NULL);
INSERT INTO public.authentication_execution VALUES ('3c0ad8a6-e801-4ea3-93ea-a954d82fecd8', NULL, 'idp-email-verification', 'FRONT', '18c98d08-d786-4ba3-b303-0e286d8efeb4', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e9b0ed9e-f839-4d2a-9a77-3ff8b8032b78', NULL, NULL, 'FRONT', '18c98d08-d786-4ba3-b303-0e286d8efeb4', 2, 20, true, '1c245c79-623a-41b1-a703-f09396c9120b', NULL);
INSERT INTO public.authentication_execution VALUES ('89466e46-ec19-4db2-9706-7a9960bb7df7', NULL, 'idp-username-password-form', 'FRONT', '1c245c79-623a-41b1-a703-f09396c9120b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('092ce7a5-f012-424d-86f5-7db2381789c5', NULL, NULL, 'FRONT', '1c245c79-623a-41b1-a703-f09396c9120b', 1, 20, true, 'e09b5714-003f-4726-9a9c-fd970b86e6f5', NULL);
INSERT INTO public.authentication_execution VALUES ('753626ef-f65a-438e-9871-3acb7e69ba29', NULL, 'conditional-user-configured', 'FRONT', 'e09b5714-003f-4726-9a9c-fd970b86e6f5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('45bc7a70-6706-40f8-9144-6499e592fbb1', NULL, 'auth-otp-form', 'FRONT', 'e09b5714-003f-4726-9a9c-fd970b86e6f5', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('17fd6b01-bfbc-44d9-a4c3-76965c344262', NULL, 'http-basic-authenticator', 'FRONT', '3a5b5059-81a2-4e60-8cab-a9260512e1ef', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fee487b6-b687-433f-a1a9-6c8be8bcdcaa', NULL, 'docker-http-basic-authenticator', 'FRONT', '156fc7e6-bced-4767-a852-1a2b33b6d618', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e11e8d54-c733-4be6-8dff-5fe7d5eb4208', NULL, 'no-cookie-redirect', 'FRONT', '3a9dd4b6-fdfd-435c-b23f-18a07876bc72', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dece0425-8e0f-4f8d-99aa-9f908be95c00', NULL, NULL, 'FRONT', '3a9dd4b6-fdfd-435c-b23f-18a07876bc72', 0, 20, true, 'ff18203e-f90f-4d3e-a695-75e5ad320589', NULL);
INSERT INTO public.authentication_execution VALUES ('c883bfbc-7d2b-420b-9a5a-d23a76ed2959', NULL, 'basic-auth', 'FRONT', 'ff18203e-f90f-4d3e-a695-75e5ad320589', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('18db1448-c520-4781-b42c-b3a9c3e2b317', NULL, 'basic-auth-otp', 'FRONT', 'ff18203e-f90f-4d3e-a695-75e5ad320589', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fdb289f2-40bc-4340-b548-830f7bda9ebe', NULL, 'auth-spnego', 'FRONT', 'ff18203e-f90f-4d3e-a695-75e5ad320589', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b7174a71-372e-4225-b9b7-b2ffa83cde0c', NULL, 'auth-cookie', 'PRIVATE', '3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4b0aca7c-c556-47d0-be60-02b342f001b6', NULL, 'auth-spnego', 'PRIVATE', '3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('347a7ed9-d803-47e0-90be-7f6f6aafe662', NULL, 'identity-provider-redirector', 'PRIVATE', '3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b3a75c42-de72-4e6e-b59b-42f0495cd30f', NULL, NULL, 'PRIVATE', '3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 2, 30, true, '293b312f-88cc-4347-a595-22e138edf092', NULL);
INSERT INTO public.authentication_execution VALUES ('8f250015-8e25-44c9-b4b3-36dcfc9e5dff', NULL, 'auth-username-password-form', 'PRIVATE', '293b312f-88cc-4347-a595-22e138edf092', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ee7e0d5c-bc02-41c3-a0bd-6ff1163ae972', NULL, NULL, 'PRIVATE', '293b312f-88cc-4347-a595-22e138edf092', 1, 20, true, 'b5b6effb-a677-4622-8220-51865debc7a4', NULL);
INSERT INTO public.authentication_execution VALUES ('ff3dfa59-a13d-409c-a9e1-275ff3799123', NULL, 'conditional-user-configured', 'PRIVATE', 'b5b6effb-a677-4622-8220-51865debc7a4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8c0ff402-d695-4c66-a0ea-5fc25878a065', NULL, 'auth-otp-form', 'PRIVATE', 'b5b6effb-a677-4622-8220-51865debc7a4', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('67c54ce8-d898-43d0-ba33-5ad8e1d24aeb', NULL, 'direct-grant-validate-username', 'PRIVATE', '3dfcbc64-d58b-4b9b-be5a-8b9796272af3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d69bd9c8-4f14-4c29-8661-05fa8b8033fe', NULL, 'direct-grant-validate-password', 'PRIVATE', '3dfcbc64-d58b-4b9b-be5a-8b9796272af3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('be90e09f-0b96-4d87-b403-e24f4531e8b9', NULL, NULL, 'PRIVATE', '3dfcbc64-d58b-4b9b-be5a-8b9796272af3', 1, 30, true, 'a955120b-09fa-4783-b9e9-39ba65fdb436', NULL);
INSERT INTO public.authentication_execution VALUES ('bf0fa290-9d63-4669-bd91-5ab6c75be269', NULL, 'conditional-user-configured', 'PRIVATE', 'a955120b-09fa-4783-b9e9-39ba65fdb436', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0eb0ccc3-f00b-427a-b7fe-4f70e1fd8915', NULL, 'direct-grant-validate-otp', 'PRIVATE', 'a955120b-09fa-4783-b9e9-39ba65fdb436', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('381eadc5-5500-48ea-8357-27e99f8d11d1', NULL, 'registration-page-form', 'PRIVATE', 'afe6f39b-9ed4-490d-9c83-53b1dc2fc184', 0, 10, true, 'd81a912d-7dc5-4572-82e3-daefb6a18b4a', NULL);
INSERT INTO public.authentication_execution VALUES ('2bef691e-1142-46a4-ba92-e2f3d530c213', NULL, 'registration-user-creation', 'PRIVATE', 'd81a912d-7dc5-4572-82e3-daefb6a18b4a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7d6a1378-b19b-4c2e-b934-c9d4eb629988', NULL, 'registration-profile-action', 'PRIVATE', 'd81a912d-7dc5-4572-82e3-daefb6a18b4a', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('22b73382-5719-4b2b-97d5-bfb56583c150', NULL, 'registration-password-action', 'PRIVATE', 'd81a912d-7dc5-4572-82e3-daefb6a18b4a', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e552fac3-4302-4559-ad71-03a3bc3832d5', NULL, 'registration-recaptcha-action', 'PRIVATE', 'd81a912d-7dc5-4572-82e3-daefb6a18b4a', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c6e6ae7b-8d06-4f22-be20-af863c6d0a06', NULL, 'reset-credentials-choose-user', 'PRIVATE', '5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('35bfdb5c-0b20-4aef-8a44-46c066d5fd83', NULL, 'reset-credential-email', 'PRIVATE', '5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('680edc34-18df-414b-8daf-4c5af6ebabef', NULL, 'reset-password', 'PRIVATE', '5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0886b0e0-eda8-44f1-a871-26ff2deec92a', NULL, NULL, 'PRIVATE', '5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 1, 40, true, '4597e608-2fcb-4f76-bb88-34e20302a965', NULL);
INSERT INTO public.authentication_execution VALUES ('151d7bf7-a218-458e-be2b-c8d07bb7c28d', NULL, 'conditional-user-configured', 'PRIVATE', '4597e608-2fcb-4f76-bb88-34e20302a965', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d77e20ca-ec19-49a8-9640-dc0f912c0c07', NULL, 'reset-otp', 'PRIVATE', '4597e608-2fcb-4f76-bb88-34e20302a965', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ad054b10-fb24-415f-b198-38ed12552aeb', NULL, 'client-secret', 'PRIVATE', 'f9e7a0be-e971-4add-aa64-766f8d4bd925', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5ce89f24-c874-4464-96e9-5ac2909cda98', NULL, 'client-jwt', 'PRIVATE', 'f9e7a0be-e971-4add-aa64-766f8d4bd925', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cc9fdf24-c700-4e62-8f04-d354c31ff7dd', NULL, 'client-secret-jwt', 'PRIVATE', 'f9e7a0be-e971-4add-aa64-766f8d4bd925', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e9e13080-02b9-44e8-83c3-8d7cecfa8bb5', NULL, 'client-x509', 'PRIVATE', 'f9e7a0be-e971-4add-aa64-766f8d4bd925', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b68ee5a2-fdba-40a6-91ba-3f200ccfbc21', NULL, 'idp-review-profile', 'PRIVATE', '1062ab56-e70b-4ecf-9ad8-162eb8f4954b', 0, 10, false, NULL, 'a45051ee-d57d-4058-9e78-5d5be38050b0');
INSERT INTO public.authentication_execution VALUES ('cb7b97d8-134e-49cf-ae35-6d23281142ff', NULL, NULL, 'PRIVATE', '1062ab56-e70b-4ecf-9ad8-162eb8f4954b', 0, 20, true, '7b792a28-3578-4fae-a664-f019908dad5f', NULL);
INSERT INTO public.authentication_execution VALUES ('176b4dab-9515-49b2-998d-23dfee82f123', NULL, 'idp-create-user-if-unique', 'PRIVATE', '7b792a28-3578-4fae-a664-f019908dad5f', 2, 10, false, NULL, '4c0893b2-a5bb-4e23-976c-8f1c80f05d96');
INSERT INTO public.authentication_execution VALUES ('b89e50ef-5f5b-4f6a-85b0-136f703c6dc7', NULL, NULL, 'PRIVATE', '7b792a28-3578-4fae-a664-f019908dad5f', 2, 20, true, '5c36b4fc-9d29-486e-888e-09f9335913b2', NULL);
INSERT INTO public.authentication_execution VALUES ('73044ab4-451e-4705-9696-7ce68a66658d', NULL, 'idp-confirm-link', 'PRIVATE', '5c36b4fc-9d29-486e-888e-09f9335913b2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('50799799-7dd0-4843-a049-62a83a5bcf13', NULL, NULL, 'PRIVATE', '5c36b4fc-9d29-486e-888e-09f9335913b2', 0, 20, true, '9e06475e-8b89-4c5e-be2e-0f1171a1b201', NULL);
INSERT INTO public.authentication_execution VALUES ('0bda49f0-41a6-4200-830b-ccc2816ff05e', NULL, 'idp-email-verification', 'PRIVATE', '9e06475e-8b89-4c5e-be2e-0f1171a1b201', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('de8e76a8-03f6-4419-aca8-3c21d57582a5', NULL, NULL, 'PRIVATE', '9e06475e-8b89-4c5e-be2e-0f1171a1b201', 2, 20, true, '53aa2095-dda1-4aa5-8fb9-f497e0d3ec3b', NULL);
INSERT INTO public.authentication_execution VALUES ('64cdfbd9-eba2-457e-baf9-4ffd87b19eb5', NULL, 'idp-username-password-form', 'PRIVATE', '53aa2095-dda1-4aa5-8fb9-f497e0d3ec3b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('41e97b5f-04ae-4f67-a2fd-3e737ba6e923', NULL, NULL, 'PRIVATE', '53aa2095-dda1-4aa5-8fb9-f497e0d3ec3b', 1, 20, true, '72402b67-04f8-40de-a801-7affd33bbf42', NULL);
INSERT INTO public.authentication_execution VALUES ('ebc795de-d19e-4085-921e-c1d609490421', NULL, 'conditional-user-configured', 'PRIVATE', '72402b67-04f8-40de-a801-7affd33bbf42', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f3322cef-ebf9-4b42-94c0-b6009a677801', NULL, 'auth-otp-form', 'PRIVATE', '72402b67-04f8-40de-a801-7affd33bbf42', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('11c0761a-2d14-46fd-af00-42e0f9661c9d', NULL, 'http-basic-authenticator', 'PRIVATE', '98bbb9ff-9fdf-4ca5-b823-0766b45f5432', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ef8dd45c-e626-4b63-a8d0-de9c4c14ca78', NULL, 'docker-http-basic-authenticator', 'PRIVATE', 'ee804575-73d8-4b85-8321-48b73d91f607', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d82d2d28-d8e5-483b-953a-0792b64a87a7', NULL, 'no-cookie-redirect', 'PRIVATE', '7d8fd9dc-9393-4914-8dac-da2007992d82', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('33086c37-6b6b-4d10-9430-c59ae6fa22a6', NULL, NULL, 'PRIVATE', '7d8fd9dc-9393-4914-8dac-da2007992d82', 0, 20, true, 'a56e3e43-bb25-4f6f-86f8-d41175e30ee5', NULL);
INSERT INTO public.authentication_execution VALUES ('33ddeda2-ceb0-423d-933f-e7352138620f', NULL, 'basic-auth', 'PRIVATE', 'a56e3e43-bb25-4f6f-86f8-d41175e30ee5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c926db74-c506-47b6-9846-db71d8809400', NULL, 'basic-auth-otp', 'PRIVATE', 'a56e3e43-bb25-4f6f-86f8-d41175e30ee5', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('48f2cab3-08ec-4320-8add-7cfb212ccb79', NULL, 'auth-spnego', 'PRIVATE', 'a56e3e43-bb25-4f6f-86f8-d41175e30ee5', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cba440ae-2953-4bfa-b2d8-d2266de25548', NULL, 'auth-cookie', 'MULTIPLE-1', '7821d025-c3eb-4585-a7d0-34e8a409da02', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6de151bd-ba20-4843-9c4a-9a55820fc8f6', NULL, 'auth-spnego', 'MULTIPLE-1', '7821d025-c3eb-4585-a7d0-34e8a409da02', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d0ea8373-49fb-4a85-ad94-1c17e256896f', NULL, 'identity-provider-redirector', 'MULTIPLE-1', '7821d025-c3eb-4585-a7d0-34e8a409da02', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2171657f-7fc8-4a59-8198-e4ff85236831', NULL, NULL, 'MULTIPLE-1', '7821d025-c3eb-4585-a7d0-34e8a409da02', 2, 30, true, '687ac4c1-d5e1-4c11-a065-e106bfd7ef4a', NULL);
INSERT INTO public.authentication_execution VALUES ('eda34847-2287-4a58-a764-cc472d0d5c12', NULL, 'auth-username-password-form', 'MULTIPLE-1', '687ac4c1-d5e1-4c11-a065-e106bfd7ef4a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9650a794-bbeb-4bcb-8a10-79872a5c75af', NULL, NULL, 'MULTIPLE-1', '687ac4c1-d5e1-4c11-a065-e106bfd7ef4a', 1, 20, true, '73239dcc-45a7-46a3-bb20-5b0d1fc1215b', NULL);
INSERT INTO public.authentication_execution VALUES ('bc47533d-aee4-42af-bae9-98acd2db86be', NULL, 'conditional-user-configured', 'MULTIPLE-1', '73239dcc-45a7-46a3-bb20-5b0d1fc1215b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5ebfbc22-daf7-4fbe-a18a-e784fcc02d5c', NULL, 'auth-otp-form', 'MULTIPLE-1', '73239dcc-45a7-46a3-bb20-5b0d1fc1215b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('640949b7-a81e-417d-bcc4-c6ba79ddf01c', NULL, 'direct-grant-validate-username', 'MULTIPLE-1', '6bd15fa5-f7fc-4ba6-a288-cae884887c60', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e6e8e187-fb22-4dd3-aed7-34e58e7b8b25', NULL, 'direct-grant-validate-password', 'MULTIPLE-1', '6bd15fa5-f7fc-4ba6-a288-cae884887c60', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('eaf874d8-9514-403c-af03-9b10cd8991a3', NULL, NULL, 'MULTIPLE-1', '6bd15fa5-f7fc-4ba6-a288-cae884887c60', 1, 30, true, '548bac08-3a7c-4554-beaa-66d7ae2f5821', NULL);
INSERT INTO public.authentication_execution VALUES ('80817b00-774f-4502-8f2e-04705425b05b', NULL, 'conditional-user-configured', 'MULTIPLE-1', '548bac08-3a7c-4554-beaa-66d7ae2f5821', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('299e5672-1ec7-4398-bc54-cdde816d774c', NULL, 'direct-grant-validate-otp', 'MULTIPLE-1', '548bac08-3a7c-4554-beaa-66d7ae2f5821', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('61dd10db-ef2d-473f-9065-68529b98d676', NULL, 'registration-page-form', 'MULTIPLE-1', '8e7190a7-dec6-4df7-86cb-c08a7fb5d5ea', 0, 10, true, '37bf3308-7cd3-4ad4-b07f-99d1be886ffe', NULL);
INSERT INTO public.authentication_execution VALUES ('373446e1-0d69-44ca-b5b4-e9b366c00cc9', NULL, 'registration-user-creation', 'MULTIPLE-1', '37bf3308-7cd3-4ad4-b07f-99d1be886ffe', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f3a39f96-7e3e-4265-968d-b53c38fe0f89', NULL, 'registration-profile-action', 'MULTIPLE-1', '37bf3308-7cd3-4ad4-b07f-99d1be886ffe', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3fe84b9a-1fae-4963-b28e-57c334581395', NULL, 'registration-password-action', 'MULTIPLE-1', '37bf3308-7cd3-4ad4-b07f-99d1be886ffe', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e97c399a-fb25-4dba-9edf-88ef94585e57', NULL, 'registration-recaptcha-action', 'MULTIPLE-1', '37bf3308-7cd3-4ad4-b07f-99d1be886ffe', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('759d42d0-e57f-4737-8693-b4f98fbca9a2', NULL, 'reset-credentials-choose-user', 'MULTIPLE-1', 'ae03d859-849b-493b-b762-acc96c667629', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1c644030-193d-4e6e-96c3-e03805b38dd2', NULL, 'reset-credential-email', 'MULTIPLE-1', 'ae03d859-849b-493b-b762-acc96c667629', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a6cc2008-f254-4708-8b6f-b08f65067584', NULL, 'reset-password', 'MULTIPLE-1', 'ae03d859-849b-493b-b762-acc96c667629', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fd4bd531-ed46-4771-ae83-d52784ae9146', NULL, NULL, 'MULTIPLE-1', 'ae03d859-849b-493b-b762-acc96c667629', 1, 40, true, '955ab8f3-0c5b-4118-afed-e2e2edfe22bf', NULL);
INSERT INTO public.authentication_execution VALUES ('25c6e1e7-7c8b-419a-8fa3-40a8dd5aa5de', NULL, 'conditional-user-configured', 'MULTIPLE-1', '955ab8f3-0c5b-4118-afed-e2e2edfe22bf', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5822ae06-f7c3-4730-8efa-529613bf4944', NULL, 'reset-otp', 'MULTIPLE-1', '955ab8f3-0c5b-4118-afed-e2e2edfe22bf', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('276cafb5-da2a-4db5-82f2-32dc2023f60e', NULL, 'client-secret', 'MULTIPLE-1', '2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e3b71bb9-1f94-48ee-9095-80c2d33f4fcb', NULL, 'client-jwt', 'MULTIPLE-1', '2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7bde8188-6f30-4a6b-a3c3-7d2e8baeb04b', NULL, 'client-secret-jwt', 'MULTIPLE-1', '2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ce0ae7f1-7be7-4a67-8f08-7c5c5735bbd6', NULL, 'client-x509', 'MULTIPLE-1', '2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a20611cb-7bd1-429c-a712-bfc9e9255a26', NULL, 'idp-review-profile', 'MULTIPLE-1', '84d5fcce-40e0-4c94-bed9-d51d959882c8', 0, 10, false, NULL, 'b8022ba1-6daa-4ed5-b0d6-5c0d12d0931e');
INSERT INTO public.authentication_execution VALUES ('0b5348e1-331d-4f87-a377-e23adbbc7ce7', NULL, NULL, 'MULTIPLE-1', '84d5fcce-40e0-4c94-bed9-d51d959882c8', 0, 20, true, '3ed128f6-7439-43b6-9c33-776468761401', NULL);
INSERT INTO public.authentication_execution VALUES ('de3d8dd6-aedb-4a90-9d8c-75f0619754df', NULL, 'idp-create-user-if-unique', 'MULTIPLE-1', '3ed128f6-7439-43b6-9c33-776468761401', 2, 10, false, NULL, '89b73fba-3959-49c5-bba1-9e7d08a55e18');
INSERT INTO public.authentication_execution VALUES ('042ea502-6af9-4d1e-aef4-82c797bc7de8', NULL, NULL, 'MULTIPLE-1', '3ed128f6-7439-43b6-9c33-776468761401', 2, 20, true, 'fbce8be7-bc36-4131-aba0-32e50ba7b7f5', NULL);
INSERT INTO public.authentication_execution VALUES ('5c5a008c-0777-49a3-a6d8-bf208ca73897', NULL, 'idp-confirm-link', 'MULTIPLE-1', 'fbce8be7-bc36-4131-aba0-32e50ba7b7f5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5f4e918d-be32-4247-af14-e0e90b0fa82d', NULL, NULL, 'MULTIPLE-1', 'fbce8be7-bc36-4131-aba0-32e50ba7b7f5', 0, 20, true, 'c4e393f4-99c0-4f41-9420-c13b6ed024d8', NULL);
INSERT INTO public.authentication_execution VALUES ('ecf22b98-60c3-4f87-b16f-6454c9bb5f5a', NULL, 'idp-email-verification', 'MULTIPLE-1', 'c4e393f4-99c0-4f41-9420-c13b6ed024d8', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bd52270a-f0d2-486c-8fe2-4dbaf3e6a39b', NULL, NULL, 'MULTIPLE-1', 'c4e393f4-99c0-4f41-9420-c13b6ed024d8', 2, 20, true, '9cec39df-b693-4824-915b-aba4a1961189', NULL);
INSERT INTO public.authentication_execution VALUES ('ee9be862-d782-4879-a2fe-ee7fa7522514', NULL, 'idp-username-password-form', 'MULTIPLE-1', '9cec39df-b693-4824-915b-aba4a1961189', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('99aa7ca2-5865-4ee7-aec9-1c96fc6c6ce9', NULL, NULL, 'MULTIPLE-1', '9cec39df-b693-4824-915b-aba4a1961189', 1, 20, true, 'a60696e9-c815-475d-813c-d3c83126605a', NULL);
INSERT INTO public.authentication_execution VALUES ('c4a32c49-14cf-4ef5-9b31-75c8abf0001e', NULL, 'conditional-user-configured', 'MULTIPLE-1', 'a60696e9-c815-475d-813c-d3c83126605a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5eb1091c-8e8e-4fc1-a28b-cd7c709d0632', NULL, 'auth-otp-form', 'MULTIPLE-1', 'a60696e9-c815-475d-813c-d3c83126605a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('de82838e-156c-4168-9c6f-648c9dcd23dd', NULL, 'http-basic-authenticator', 'MULTIPLE-1', 'b3683398-e300-45d0-8b27-bd6d20fdc6df', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('74fb8593-758b-42b6-809d-83557fd5cfb8', NULL, 'docker-http-basic-authenticator', 'MULTIPLE-1', 'e4325e59-1e61-4395-ba88-48e1b78d4f56', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e230ce7b-2cfc-4335-a375-462d9dc52be1', NULL, 'no-cookie-redirect', 'MULTIPLE-1', '5fc9f53b-7907-442c-ad7c-d7fe5228b416', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('28b4d68c-131f-486a-a942-5d96b883f788', NULL, NULL, 'MULTIPLE-1', '5fc9f53b-7907-442c-ad7c-d7fe5228b416', 0, 20, true, '176a4be0-291a-475e-bb6b-7a3cda5a4245', NULL);
INSERT INTO public.authentication_execution VALUES ('fa6c47cd-f563-4772-9ca8-0564f8f2d3bf', NULL, 'basic-auth', 'MULTIPLE-1', '176a4be0-291a-475e-bb6b-7a3cda5a4245', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d95e9ebd-d6e6-4d07-a113-04dc34570917', NULL, 'basic-auth-otp', 'MULTIPLE-1', '176a4be0-291a-475e-bb6b-7a3cda5a4245', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f27286e8-675b-4512-843f-982eefdd5fb3', NULL, 'auth-spnego', 'MULTIPLE-1', '176a4be0-291a-475e-bb6b-7a3cda5a4245', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9589432d-35ad-4b66-8df9-48d20208b694', NULL, 'auth-cookie', 'MULTIPLE-2', 'ccbd755f-b0ce-45db-a84c-da07c2ac44e0', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('96d5cddd-9353-4c7d-818d-aa450643ae58', NULL, 'auth-spnego', 'MULTIPLE-2', 'ccbd755f-b0ce-45db-a84c-da07c2ac44e0', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('59f9d7b2-cf2b-4ca9-a38b-a3086972b6e6', NULL, 'identity-provider-redirector', 'MULTIPLE-2', 'ccbd755f-b0ce-45db-a84c-da07c2ac44e0', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a2ea60b5-0ad7-4315-99ce-a71fa374cc4d', NULL, NULL, 'MULTIPLE-2', 'ccbd755f-b0ce-45db-a84c-da07c2ac44e0', 2, 30, true, 'b3b6ea99-571e-4699-95f6-af8b81d5b63a', NULL);
INSERT INTO public.authentication_execution VALUES ('4ee70a94-964d-445a-96da-bedf87bb33db', NULL, 'auth-username-password-form', 'MULTIPLE-2', 'b3b6ea99-571e-4699-95f6-af8b81d5b63a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bf8d886f-9add-4c19-9f19-60380785fad4', NULL, NULL, 'MULTIPLE-2', 'b3b6ea99-571e-4699-95f6-af8b81d5b63a', 1, 20, true, '5f59be9a-96f6-497c-99dd-bbe150ca4053', NULL);
INSERT INTO public.authentication_execution VALUES ('f07d1154-78c6-49c5-9ed3-77e7430672da', NULL, 'conditional-user-configured', 'MULTIPLE-2', '5f59be9a-96f6-497c-99dd-bbe150ca4053', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('476b7fff-756c-44ec-b8ea-46aef089638f', NULL, 'auth-otp-form', 'MULTIPLE-2', '5f59be9a-96f6-497c-99dd-bbe150ca4053', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b588080c-3a08-4aaa-8a2b-146d16f759a1', NULL, 'direct-grant-validate-username', 'MULTIPLE-2', '5712f937-3513-43c5-bc1f-fe7f686c40d3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7e04d764-5c66-4efe-8ae9-1347451e03eb', NULL, 'direct-grant-validate-password', 'MULTIPLE-2', '5712f937-3513-43c5-bc1f-fe7f686c40d3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0495da3f-619c-4ff3-b867-38f3ec089d46', NULL, NULL, 'MULTIPLE-2', '5712f937-3513-43c5-bc1f-fe7f686c40d3', 1, 30, true, '8001d8ca-89d7-4f80-8101-31ce651b3443', NULL);
INSERT INTO public.authentication_execution VALUES ('6cab3226-036b-48f1-b003-1e7e25032e38', NULL, 'conditional-user-configured', 'MULTIPLE-2', '8001d8ca-89d7-4f80-8101-31ce651b3443', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e4785b7d-6042-4bda-b2c1-d35527aaf2b5', NULL, 'direct-grant-validate-otp', 'MULTIPLE-2', '8001d8ca-89d7-4f80-8101-31ce651b3443', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cdd57920-a508-4506-852c-d88ebbe2c9d0', NULL, 'registration-page-form', 'MULTIPLE-2', '554f1567-a51d-4ee0-8f4b-d8c00e2ac47d', 0, 10, true, '48e3254d-2625-42f4-a93c-0232a5db1a6b', NULL);
INSERT INTO public.authentication_execution VALUES ('c4a20e51-fdda-4f08-bc2b-c6c2d3f980b1', NULL, 'registration-user-creation', 'MULTIPLE-2', '48e3254d-2625-42f4-a93c-0232a5db1a6b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9d4d6c7d-6f09-4fc7-ae9f-0a692888c223', NULL, 'registration-profile-action', 'MULTIPLE-2', '48e3254d-2625-42f4-a93c-0232a5db1a6b', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b3f8cdd3-bfbc-4f9e-92ac-eccd8135ae4c', NULL, 'registration-password-action', 'MULTIPLE-2', '48e3254d-2625-42f4-a93c-0232a5db1a6b', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8f478599-08bc-4d44-aa5f-b32d0173625c', NULL, 'registration-recaptcha-action', 'MULTIPLE-2', '48e3254d-2625-42f4-a93c-0232a5db1a6b', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b2afd45a-e611-4185-8d69-8f34ccc5577e', NULL, 'reset-credentials-choose-user', 'MULTIPLE-2', 'ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8aa606b3-85d3-4405-b78e-94912385a55f', NULL, 'reset-credential-email', 'MULTIPLE-2', 'ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c9877fc9-e1c6-4c29-9330-a08037f24edf', NULL, 'reset-password', 'MULTIPLE-2', 'ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('491c8207-258d-4c68-8d4a-75e5be5340e9', NULL, NULL, 'MULTIPLE-2', 'ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 1, 40, true, 'a7cb927b-94df-4140-840f-58cf08a0f909', NULL);
INSERT INTO public.authentication_execution VALUES ('5b2fc145-f8ad-4390-a1ed-05b80d2381b8', NULL, 'conditional-user-configured', 'MULTIPLE-2', 'a7cb927b-94df-4140-840f-58cf08a0f909', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c4d41515-5ffd-44f1-bb17-5db17e02b995', NULL, 'reset-otp', 'MULTIPLE-2', 'a7cb927b-94df-4140-840f-58cf08a0f909', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3a639137-1d42-48b0-a0ab-3def89ed2e9c', NULL, 'client-secret', 'MULTIPLE-2', 'eb8239d7-d885-4447-a6d4-319be8278504', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d4bfd4f1-6128-4e30-86f6-23d1f3441620', NULL, 'client-jwt', 'MULTIPLE-2', 'eb8239d7-d885-4447-a6d4-319be8278504', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e91db9eb-5ab4-4b28-be00-37fc1db1a447', NULL, 'client-secret-jwt', 'MULTIPLE-2', 'eb8239d7-d885-4447-a6d4-319be8278504', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7c6e7e31-4e28-4174-b020-f310a5b2a033', NULL, 'client-x509', 'MULTIPLE-2', 'eb8239d7-d885-4447-a6d4-319be8278504', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('479c3c3f-f9a3-4601-aa02-64f2d1a1f098', NULL, 'idp-review-profile', 'MULTIPLE-2', '98963ba6-42bd-404a-9c2e-01b1ac5cd40b', 0, 10, false, NULL, '6c6cef8d-bf3b-4af6-ba70-286f4a8f4d07');
INSERT INTO public.authentication_execution VALUES ('f32e6fac-5d23-435a-bcb0-2573227c98a6', NULL, NULL, 'MULTIPLE-2', '98963ba6-42bd-404a-9c2e-01b1ac5cd40b', 0, 20, true, '8b53463e-3541-4e01-849f-41d838167a01', NULL);
INSERT INTO public.authentication_execution VALUES ('58cc2649-11de-4902-9660-cdb2cae2a79a', NULL, 'idp-create-user-if-unique', 'MULTIPLE-2', '8b53463e-3541-4e01-849f-41d838167a01', 2, 10, false, NULL, 'b00d96c0-1fd6-4974-b66d-06eedd92ec54');
INSERT INTO public.authentication_execution VALUES ('25882ea6-d61a-45b0-a078-c3a435092139', NULL, NULL, 'MULTIPLE-2', '8b53463e-3541-4e01-849f-41d838167a01', 2, 20, true, '88d8670c-3bd8-4721-bf16-ef71d26b3410', NULL);
INSERT INTO public.authentication_execution VALUES ('35f541f0-3c32-4b3a-8efb-5a306a5ca177', NULL, 'idp-confirm-link', 'MULTIPLE-2', '88d8670c-3bd8-4721-bf16-ef71d26b3410', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7444c191-ec58-42d7-bec7-bd91b378db0a', NULL, NULL, 'MULTIPLE-2', '88d8670c-3bd8-4721-bf16-ef71d26b3410', 0, 20, true, '166ceccd-ce24-481f-8faf-c1860b22ca2d', NULL);
INSERT INTO public.authentication_execution VALUES ('19a1a602-42fb-431e-babe-b292a1eede4f', NULL, 'idp-email-verification', 'MULTIPLE-2', '166ceccd-ce24-481f-8faf-c1860b22ca2d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e1d2df27-2d53-4f4a-81b2-e53939edfa00', NULL, NULL, 'MULTIPLE-2', '166ceccd-ce24-481f-8faf-c1860b22ca2d', 2, 20, true, 'de83b390-594b-40da-a570-fdf8155f961f', NULL);
INSERT INTO public.authentication_execution VALUES ('4401aae0-596e-4a2a-992b-c32fdc495970', NULL, 'idp-username-password-form', 'MULTIPLE-2', 'de83b390-594b-40da-a570-fdf8155f961f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fb24307a-e2f3-4362-82e2-d6fbf6fbc181', NULL, NULL, 'MULTIPLE-2', 'de83b390-594b-40da-a570-fdf8155f961f', 1, 20, true, '56b1d92d-c9c4-473a-a3a6-995d2f39fb41', NULL);
INSERT INTO public.authentication_execution VALUES ('1dbc9011-7f62-43f4-aa5a-9d415dc9cb22', NULL, 'conditional-user-configured', 'MULTIPLE-2', '56b1d92d-c9c4-473a-a3a6-995d2f39fb41', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ddee15b8-07bf-40d1-982d-572a8bb481eb', NULL, 'auth-otp-form', 'MULTIPLE-2', '56b1d92d-c9c4-473a-a3a6-995d2f39fb41', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('aafc59ce-7503-462f-9d6a-bf182ee874c8', NULL, 'http-basic-authenticator', 'MULTIPLE-2', 'b6b96fa6-3482-4d78-9d67-e12bbcc5fcdb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d663e33f-461b-48b4-836b-7c91eec146af', NULL, 'docker-http-basic-authenticator', 'MULTIPLE-2', 'a6c6895e-a899-4f55-9589-70662019b56d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ece94c66-c3dd-428a-ba27-b2d2c92161a9', NULL, 'no-cookie-redirect', 'MULTIPLE-2', '54e91ea0-a123-4ef6-b1cf-8e336af97b6a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fae48358-cac0-45d9-a9e9-fe84dc1a3cd8', NULL, NULL, 'MULTIPLE-2', '54e91ea0-a123-4ef6-b1cf-8e336af97b6a', 0, 20, true, '3be4b150-7802-4c09-bbc6-c8c91eaac1f3', NULL);
INSERT INTO public.authentication_execution VALUES ('d14c4569-0158-4656-86f2-3cd02e8b8976', NULL, 'basic-auth', 'MULTIPLE-2', '3be4b150-7802-4c09-bbc6-c8c91eaac1f3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('756c7718-a877-4ce2-a4a3-339a062b9c22', NULL, 'basic-auth-otp', 'MULTIPLE-2', '3be4b150-7802-4c09-bbc6-c8c91eaac1f3', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('228bade7-be39-4f1e-ae74-436d62de2e99', NULL, 'auth-spnego', 'MULTIPLE-2', '3be4b150-7802-4c09-bbc6-c8c91eaac1f3', 3, 30, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authentication_flow VALUES ('e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('84e6c2af-bf4d-455d-a84a-a11db79cee97', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('6d27669e-bed1-470a-a40e-6d72aa69b23c', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('4b233f33-8b76-48c3-9cd2-c13bc4e8049a', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('fa282cb4-255c-4476-bf49-bb27dd5f8ebd', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('cde407a2-b40e-4622-837a-2f878ebcfd21', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8daa9435-f0ed-4697-ae88-9b5d97fb62fd', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('55cca2aa-a766-4f62-abf1-3668615e78cc', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('034f4f69-d9d8-4b44-9cb5-201db0f745f2', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('45017b66-884b-4ff8-a839-cc1600f6255d', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('10b16c62-51fb-43fa-bc41-8ec3cfd93850', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('024dbb88-b40a-43e3-933d-b9df9fbec266', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3fa8303a-90d4-4da1-9c7e-b5833ebe37d5', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f92c399a-edc3-4d58-8923-62dbb41459aa', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2261c837-0e2b-4da6-81ae-691975666494', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('60fdd950-4aef-4ef2-992a-0156b2d05b65', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('4d522d12-dce0-48ba-8bc6-f240dbfbaeb5', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('53989273-1267-4c56-b4d9-411956c872dc', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3672984b-6cc5-44f5-895a-cc1f95289d86', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('0b0e6067-2ce4-41b7-b491-1ee61cec2d66', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('77a905ee-a1f6-4c22-a891-057d5c1aaf50', 'browser', 'browser based authentication', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('fe918877-9137-48f1-9007-118e423b44d0', 'forms', 'Username, password, otp and other auth forms.', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ce890549-e5d1-4d68-9274-4160e855707b', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('800bcba7-6b80-4747-8a89-278ac11beb14', 'direct grant', 'OpenID Connect Resource Owner Grant', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('4164cb91-fa06-4f07-9c63-a224ed6f0c8c', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('995d8bbd-7e57-45aa-ac5e-897778f2c106', 'registration', 'registration flow', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('ed7ac6c9-0fa8-452c-9ac8-21b2494cb56d', 'registration form', 'registration form', 'FRONT', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2ddb73a1-7125-4558-bf44-e4d994de73ed', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e454bfd4-4df4-406e-97c9-89d45727d83b', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2a699451-16ae-48a0-bd55-d7273d571d29', 'clients', 'Base authentication for clients', 'FRONT', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('52386ea4-f957-4c5c-aa47-f4f2d8da89e8', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d487c333-24ad-42ee-9b9c-6ce1e8f07f2a', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('35887902-7404-4b30-99be-058fb52a1576', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('18c98d08-d786-4ba3-b303-0e286d8efeb4', 'Account verification options', 'Method with which to verity the existing account', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('1c245c79-623a-41b1-a703-f09396c9120b', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('e09b5714-003f-4726-9a9c-fd970b86e6f5', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3a5b5059-81a2-4e60-8cab-a9260512e1ef', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('156fc7e6-bced-4767-a852-1a2b33b6d618', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3a9dd4b6-fdfd-435c-b23f-18a07876bc72', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'FRONT', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('ff18203e-f90f-4d3e-a695-75e5ad320589', 'Authentication Options', 'Authentication options.', 'FRONT', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 'browser', 'browser based authentication', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('293b312f-88cc-4347-a595-22e138edf092', 'forms', 'Username, password, otp and other auth forms.', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('b5b6effb-a677-4622-8220-51865debc7a4', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3dfcbc64-d58b-4b9b-be5a-8b9796272af3', 'direct grant', 'OpenID Connect Resource Owner Grant', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a955120b-09fa-4783-b9e9-39ba65fdb436', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('afe6f39b-9ed4-490d-9c83-53b1dc2fc184', 'registration', 'registration flow', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d81a912d-7dc5-4572-82e3-daefb6a18b4a', 'registration form', 'registration form', 'PRIVATE', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('4597e608-2fcb-4f76-bb88-34e20302a965', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f9e7a0be-e971-4add-aa64-766f8d4bd925', 'clients', 'Base authentication for clients', 'PRIVATE', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1062ab56-e70b-4ecf-9ad8-162eb8f4954b', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('7b792a28-3578-4fae-a664-f019908dad5f', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5c36b4fc-9d29-486e-888e-09f9335913b2', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9e06475e-8b89-4c5e-be2e-0f1171a1b201', 'Account verification options', 'Method with which to verity the existing account', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('53aa2095-dda1-4aa5-8fb9-f497e0d3ec3b', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('72402b67-04f8-40de-a801-7affd33bbf42', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('98bbb9ff-9fdf-4ca5-b823-0766b45f5432', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('ee804575-73d8-4b85-8321-48b73d91f607', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('7d8fd9dc-9393-4914-8dac-da2007992d82', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'PRIVATE', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a56e3e43-bb25-4f6f-86f8-d41175e30ee5', 'Authentication Options', 'Authentication options.', 'PRIVATE', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7821d025-c3eb-4585-a7d0-34e8a409da02', 'browser', 'browser based authentication', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('687ac4c1-d5e1-4c11-a065-e106bfd7ef4a', 'forms', 'Username, password, otp and other auth forms.', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('73239dcc-45a7-46a3-bb20-5b0d1fc1215b', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('6bd15fa5-f7fc-4ba6-a288-cae884887c60', 'direct grant', 'OpenID Connect Resource Owner Grant', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('548bac08-3a7c-4554-beaa-66d7ae2f5821', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('8e7190a7-dec6-4df7-86cb-c08a7fb5d5ea', 'registration', 'registration flow', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('37bf3308-7cd3-4ad4-b07f-99d1be886ffe', 'registration form', 'registration form', 'MULTIPLE-1', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ae03d859-849b-493b-b762-acc96c667629', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('955ab8f3-0c5b-4118-afed-e2e2edfe22bf', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 'clients', 'Base authentication for clients', 'MULTIPLE-1', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('84d5fcce-40e0-4c94-bed9-d51d959882c8', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3ed128f6-7439-43b6-9c33-776468761401', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('fbce8be7-bc36-4131-aba0-32e50ba7b7f5', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c4e393f4-99c0-4f41-9420-c13b6ed024d8', 'Account verification options', 'Method with which to verity the existing account', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9cec39df-b693-4824-915b-aba4a1961189', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('a60696e9-c815-475d-813c-d3c83126605a', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('b3683398-e300-45d0-8b27-bd6d20fdc6df', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e4325e59-1e61-4395-ba88-48e1b78d4f56', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5fc9f53b-7907-442c-ad7c-d7fe5228b416', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'MULTIPLE-1', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('176a4be0-291a-475e-bb6b-7a3cda5a4245', 'Authentication Options', 'Authentication options.', 'MULTIPLE-1', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ccbd755f-b0ce-45db-a84c-da07c2ac44e0', 'browser', 'browser based authentication', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('b3b6ea99-571e-4699-95f6-af8b81d5b63a', 'forms', 'Username, password, otp and other auth forms.', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5f59be9a-96f6-497c-99dd-bbe150ca4053', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5712f937-3513-43c5-bc1f-fe7f686c40d3', 'direct grant', 'OpenID Connect Resource Owner Grant', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8001d8ca-89d7-4f80-8101-31ce651b3443', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('554f1567-a51d-4ee0-8f4b-d8c00e2ac47d', 'registration', 'registration flow', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('48e3254d-2625-42f4-a93c-0232a5db1a6b', 'registration form', 'registration form', 'MULTIPLE-2', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a7cb927b-94df-4140-840f-58cf08a0f909', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('eb8239d7-d885-4447-a6d4-319be8278504', 'clients', 'Base authentication for clients', 'MULTIPLE-2', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('98963ba6-42bd-404a-9c2e-01b1ac5cd40b', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8b53463e-3541-4e01-849f-41d838167a01', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('88d8670c-3bd8-4721-bf16-ef71d26b3410', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('166ceccd-ce24-481f-8faf-c1860b22ca2d', 'Account verification options', 'Method with which to verity the existing account', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('de83b390-594b-40da-a570-fdf8155f961f', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('56b1d92d-c9c4-473a-a3a6-995d2f39fb41', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'MULTIPLE-2', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('b6b96fa6-3482-4d78-9d67-e12bbcc5fcdb', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a6c6895e-a899-4f55-9589-70662019b56d', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('54e91ea0-a123-4ef6-b1cf-8e336af97b6a', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'MULTIPLE-2', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3be4b150-7802-4c09-bbc6-c8c91eaac1f3', 'Authentication Options', 'Authentication options.', 'MULTIPLE-2', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authenticator_config VALUES ('997bcde4-af16-45a3-b457-4be23a8ffc66', 'review profile config', 'master');
INSERT INTO public.authenticator_config VALUES ('4957de23-3a72-42ac-84fa-a18dfb9afb8e', 'create unique user config', 'master');
INSERT INTO public.authenticator_config VALUES ('ccae57da-d73a-4188-9487-4e6967d672f6', 'review profile config', 'FRONT');
INSERT INTO public.authenticator_config VALUES ('61a7a6e9-ac4e-4e00-ad47-9d8b7f00c03a', 'create unique user config', 'FRONT');
INSERT INTO public.authenticator_config VALUES ('a45051ee-d57d-4058-9e78-5d5be38050b0', 'review profile config', 'PRIVATE');
INSERT INTO public.authenticator_config VALUES ('4c0893b2-a5bb-4e23-976c-8f1c80f05d96', 'create unique user config', 'PRIVATE');
INSERT INTO public.authenticator_config VALUES ('b8022ba1-6daa-4ed5-b0d6-5c0d12d0931e', 'review profile config', 'MULTIPLE-1');
INSERT INTO public.authenticator_config VALUES ('89b73fba-3959-49c5-bba1-9e7d08a55e18', 'create unique user config', 'MULTIPLE-1');
INSERT INTO public.authenticator_config VALUES ('6c6cef8d-bf3b-4af6-ba70-286f4a8f4d07', 'review profile config', 'MULTIPLE-2');
INSERT INTO public.authenticator_config VALUES ('b00d96c0-1fd6-4974-b66d-06eedd92ec54', 'create unique user config', 'MULTIPLE-2');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authenticator_config_entry VALUES ('997bcde4-af16-45a3-b457-4be23a8ffc66', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('4957de23-3a72-42ac-84fa-a18dfb9afb8e', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('ccae57da-d73a-4188-9487-4e6967d672f6', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('61a7a6e9-ac4e-4e00-ad47-9d8b7f00c03a', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('a45051ee-d57d-4058-9e78-5d5be38050b0', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('4c0893b2-a5bb-4e23-976c-8f1c80f05d96', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('b8022ba1-6daa-4ed5-b0d6-5c0d12d0931e', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('89b73fba-3959-49c5-bba1-9e7d08a55e18', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('6c6cef8d-bf3b-4af6-ba70-286f4a8f4d07', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('b00d96c0-1fd6-4974-b66d-06eedd92ec54', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', true, true, 'master-realm', 0, false, '48978cfe-1ccb-4f57-a067-f01520e46c4a', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', true, false, 'account', 0, false, 'd33814d6-46f7-4620-a8b2-85457e3169c9', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', true, false, 'account-console', 0, true, '9ba14370-2d60-4ec2-a553-0dfadaeb1ede', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', true, false, 'broker', 0, false, 'd495ef59-2427-42f4-a238-ea0fd75c9e7f', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', true, false, 'security-admin-console', 0, true, 'aa62fd0d-785f-45ad-9d7a-3ce968e2a739', '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', true, false, 'admin-cli', 0, true, 'b7801fd4-8431-423c-8b43-f25be81292e9', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, true, 'FRONT-realm', 0, false, '661026bb-833f-46b8-a990-14c952fb7503', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'FRONT Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', true, false, 'admin-cli', 0, true, '776399db-6b60-40aa-8585-93022c9cbdc8', NULL, false, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', true, false, 'realm-management', 0, false, 'f3a35f19-282e-488d-985f-b74505e20ac3', NULL, true, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', true, false, 'account', 0, false, '206623c7-0e49-4d7c-97f4-88396142ab45', '/realms/FRONT/account/', false, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', true, false, 'account-console', 0, true, '46c1a222-1c6e-495b-9dc2-e193399d86cf', '/realms/FRONT/account/', false, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', true, false, 'broker', 0, false, '745b2343-1fb4-4fe1-95e8-8946376c235b', NULL, false, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', true, false, 'security-admin-console', 0, true, 'e1b64a74-a239-433f-ac58-d187e7ac21f5', '/admin/FRONT/console/', false, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', true, false, 'admin-cli', 0, true, '3be68b02-bec2-482a-89d9-2aea083592c9', NULL, false, NULL, false, 'FRONT', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('e128d539-065f-42ce-a255-4999494942d6', true, true, 'public-client', 0, true, 'cbae29b3-5e75-4af3-989d-1f2fad544a73', NULL, false, NULL, false, 'FRONT', 'openid-connect', -1, false, false, NULL, false, 'client-secret', NULL, NULL, NULL, true, false, true, false);
INSERT INTO public.client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', true, true, 'PRIVATE-realm', 0, false, 'bc085c29-b8d4-4b5a-82c8-ddc454c0c4b0', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'PRIVATE Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', true, false, 'realm-management', 0, false, 'cc66ffcf-6353-4546-b214-6f354b506767', NULL, true, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, false, 'account', 0, false, '20a99607-087d-4c9c-8fa2-73f917b36550', '/realms/PRIVATE/account/', false, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', true, false, 'account-console', 0, true, '65cb8031-847f-4a63-9279-13edff057a90', '/realms/PRIVATE/account/', false, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', true, false, 'broker', 0, false, '8348ce9f-c19d-4c0f-810f-c9de9c49ac01', NULL, false, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', true, false, 'security-admin-console', 0, true, '9eec0e30-91cd-436e-a3ee-796b8a5d4a9b', '/admin/PRIVATE/console/', false, NULL, false, 'PRIVATE', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', true, true, 'private-client', 0, false, '4dfe11cf-6fbb-46c0-8846-0ecc62628333', NULL, false, NULL, false, 'PRIVATE', 'openid-connect', -1, false, false, NULL, true, 'client-secret', NULL, NULL, NULL, true, false, true, false);
INSERT INTO public.client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', true, true, 'MULTIPLE-1-realm', 0, false, '0551bcf0-68c1-477d-afb2-6289a64aa1ed', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'MULTIPLE-1 Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', true, false, 'realm-management', 0, false, '1205a398-c955-4784-9006-2de5b581ed93', NULL, true, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, false, 'account', 0, false, '8ade2d28-c8a6-4b94-b2a6-93fa9d401634', '/realms/MULTIPLE-1/account/', false, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', true, false, 'account-console', 0, true, '27b036c7-36de-4dcf-80c2-3b7bdc6cab39', '/realms/MULTIPLE-1/account/', false, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', true, false, 'broker', 0, false, '0acd7930-5d1d-4533-96a4-e21f5f989c0d', NULL, false, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', true, false, 'security-admin-console', 0, true, '6c4cd791-cbc9-457d-ab39-7fab4a01009c', '/admin/MULTIPLE-1/console/', false, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', true, false, 'admin-cli', 0, true, '354b6816-e861-4b77-bb06-413028b4dc09', NULL, false, NULL, false, 'MULTIPLE-1', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', true, true, 'multiple-1-client', 0, false, 'f78cfd72-0354-487c-94cc-0611a0a12889', NULL, false, NULL, false, 'MULTIPLE-1', 'openid-connect', -1, false, false, NULL, true, 'client-secret', NULL, NULL, NULL, true, false, true, false);
INSERT INTO public.client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, true, 'MULTIPLE-2-realm', 0, false, '8ed51520-a069-4b1b-b130-6fc39489c295', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'MULTIPLE-2 Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', true, false, 'realm-management', 0, false, 'a8fd88ea-13b1-496f-9cc1-882331d55bf4', NULL, true, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', true, false, 'account', 0, false, '969a9502-d0b4-4892-be85-d9927e2e782b', '/realms/MULTIPLE-2/account/', false, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', true, true, 'multiple-2-client', 0, false, '018790e4-6e29-4e01-9c1b-8e0b6bf5d77c', NULL, false, NULL, false, 'MULTIPLE-2', 'openid-connect', -1, false, false, NULL, true, 'client-secret', NULL, NULL, NULL, true, false, true, false);
INSERT INTO public.client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', true, false, 'account-console', 0, true, '17eaeade-f56b-4b93-b29f-b33becf23b76', '/realms/MULTIPLE-2/account/', false, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', true, false, 'broker', 0, false, '0ddac8de-deee-44da-956e-c780c31c6d80', NULL, false, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', true, false, 'security-admin-console', 0, true, '8bb25979-664b-44de-bbfa-9cd69f534a68', '/admin/MULTIPLE-2/console/', false, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', true, false, 'admin-cli', 0, true, '25869987-fd3d-4151-9f84-ec0e0b4bbc7d', NULL, false, NULL, false, 'MULTIPLE-2', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_attributes VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', NULL, 'request.uris');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL, 'request.uris');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', NULL, 'request.uris');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL, 'request.uris');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'false', 'display.on.consent.screen');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_default_roles VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '3f5fbaf9-67f4-4d47-99d7-292ed84bab31');
INSERT INTO public.client_default_roles VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '54698925-844c-4dcc-b505-4629d5a6191e');
INSERT INTO public.client_default_roles VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', 'd4c9d85b-026f-4f0c-b9ea-26219fe7bd4e');
INSERT INTO public.client_default_roles VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '1d74ae8d-2aa0-4118-a1bb-ae42f563923a');
INSERT INTO public.client_default_roles VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', 'b8f83c6a-0d16-4912-bba1-2b7a29e26fbd');
INSERT INTO public.client_default_roles VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '5a7f1fa1-1419-4387-a8f4-e52e1415fb7b');
INSERT INTO public.client_default_roles VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '6bca112b-e6bc-4a33-b953-11500c629bd9');
INSERT INTO public.client_default_roles VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', 'b416307b-5684-4bde-ac76-31a8ad58f11b');
INSERT INTO public.client_default_roles VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '86009589-4589-4207-84d3-21ed456de9a3');
INSERT INTO public.client_default_roles VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', 'ba49cc6b-a283-4227-8ab4-2ea356cc16fb');


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope VALUES ('69c8a637-b515-497c-b520-75f13b2a7921', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3b477f97-3980-4292-838a-06b6f5c1cd1c', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('899db04f-fec1-4927-a1fc-1858db3fb9b1', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('550681ed-8385-40d7-ab96-e9362d9ea5d8', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('999de5ea-c246-48b7-ac19-39656c5cbe65', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('5f53e875-380b-4a5f-8868-35d3bf3fa68c', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('c6fcac3d-1685-4d29-b9bf-817ef7d0f232', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('fd6de16c-7842-4017-be9a-71deec913efa', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('22707625-d41e-497c-bace-e7a813aaa540', 'offline_access', 'FRONT', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('4405da81-2a2b-4635-b640-c6602e149249', 'role_list', 'FRONT', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('f0690f74-6443-4e88-b325-b1685b29e13b', 'profile', 'FRONT', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('83b17e4e-ece2-4f51-9e61-1a1eca679481', 'email', 'FRONT', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('d52b9d2d-fcbf-4971-a130-8f247c796b49', 'address', 'FRONT', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('2f381d78-5b8d-4141-ac75-ed1a79d8d32b', 'phone', 'FRONT', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('334c9858-805b-4009-b2ee-f41675423704', 'roles', 'FRONT', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', 'web-origins', 'FRONT', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('e7e4d14c-7d5a-42a6-986b-5505fa5432b1', 'microprofile-jwt', 'FRONT', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('f58a4944-62f0-4f47-825d-9476cd4433e8', 'offline_access', 'PRIVATE', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3699b254-0664-4b07-9e7a-d968bdad3df8', 'role_list', 'PRIVATE', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('3081cb26-994c-4e00-ae3e-a82637769dd0', 'profile', 'PRIVATE', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('7671b352-cec6-4316-b98a-437d4c9beb50', 'email', 'PRIVATE', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('dd571a9c-e5f6-419b-bb83-3de8000c65f8', 'address', 'PRIVATE', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', 'phone', 'PRIVATE', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('9aa56e87-5d61-4c77-b350-22f7bd22dc77', 'roles', 'PRIVATE', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('75fd9f90-1839-4625-8edc-1583f9d237c7', 'web-origins', 'PRIVATE', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('e036bf2e-0de5-4061-b86b-78a9ac863f82', 'microprofile-jwt', 'PRIVATE', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', 'offline_access', 'MULTIPLE-1', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('ffb8a4b5-4a88-47db-ba96-466cabb4782d', 'role_list', 'MULTIPLE-1', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('1f83de5f-37aa-49d9-81fb-409e19ec3376', 'profile', 'MULTIPLE-1', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('8fbf8034-afbf-4040-9ec5-ec032802d961', 'email', 'MULTIPLE-1', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('f4697e9b-4da9-43aa-ad21-6b9e10113314', 'address', 'MULTIPLE-1', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3c13a0ee-606c-44e4-86b2-b73a965d3299', 'phone', 'MULTIPLE-1', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('b2ace36e-f791-4587-a1e5-466e6df5fb35', 'roles', 'MULTIPLE-1', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6e375a5a-2cc1-456f-9323-7ead1e0d485f', 'web-origins', 'MULTIPLE-1', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('c5df37e4-6b8d-45a8-b005-327efe82b248', 'microprofile-jwt', 'MULTIPLE-1', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('032504f4-ea20-445c-a3e1-4d951148847e', 'offline_access', 'MULTIPLE-2', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6dab14c3-5ac0-4377-99e3-eaefadf7d47c', 'role_list', 'MULTIPLE-2', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('3473998a-007f-450e-82c7-cc0bcf5e47b0', 'profile', 'MULTIPLE-2', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('56d220d0-0834-442f-a089-982de60c31a3', 'email', 'MULTIPLE-2', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('090910ec-4835-4119-8494-cf35d3d421b4', 'address', 'MULTIPLE-2', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6f603f25-df06-48a1-b072-5d9f813f1d28', 'phone', 'MULTIPLE-2', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('d7b29718-8706-48c4-a971-080ad4a9d566', 'roles', 'MULTIPLE-2', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('b23103d8-b4e5-4997-b762-5e26299b62dd', 'web-origins', 'MULTIPLE-2', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('5201565d-e810-4525-bd7e-cfab2a376e1f', 'microprofile-jwt', 'MULTIPLE-2', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_attributes VALUES ('69c8a637-b515-497c-b520-75f13b2a7921', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('69c8a637-b515-497c-b520-75f13b2a7921', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3b477f97-3980-4292-838a-06b6f5c1cd1c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3b477f97-3980-4292-838a-06b6f5c1cd1c', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('899db04f-fec1-4927-a1fc-1858db3fb9b1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('899db04f-fec1-4927-a1fc-1858db3fb9b1', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('899db04f-fec1-4927-a1fc-1858db3fb9b1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('550681ed-8385-40d7-ab96-e9362d9ea5d8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('550681ed-8385-40d7-ab96-e9362d9ea5d8', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('550681ed-8385-40d7-ab96-e9362d9ea5d8', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('999de5ea-c246-48b7-ac19-39656c5cbe65', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('999de5ea-c246-48b7-ac19-39656c5cbe65', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('999de5ea-c246-48b7-ac19-39656c5cbe65', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('5f53e875-380b-4a5f-8868-35d3bf3fa68c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('5f53e875-380b-4a5f-8868-35d3bf3fa68c', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('5f53e875-380b-4a5f-8868-35d3bf3fa68c', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('c6fcac3d-1685-4d29-b9bf-817ef7d0f232', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('c6fcac3d-1685-4d29-b9bf-817ef7d0f232', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('c6fcac3d-1685-4d29-b9bf-817ef7d0f232', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('fd6de16c-7842-4017-be9a-71deec913efa', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('fd6de16c-7842-4017-be9a-71deec913efa', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('22707625-d41e-497c-bace-e7a813aaa540', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('22707625-d41e-497c-bace-e7a813aaa540', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('4405da81-2a2b-4635-b640-c6602e149249', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('4405da81-2a2b-4635-b640-c6602e149249', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f0690f74-6443-4e88-b325-b1685b29e13b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f0690f74-6443-4e88-b325-b1685b29e13b', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f0690f74-6443-4e88-b325-b1685b29e13b', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('83b17e4e-ece2-4f51-9e61-1a1eca679481', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('83b17e4e-ece2-4f51-9e61-1a1eca679481', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('83b17e4e-ece2-4f51-9e61-1a1eca679481', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('d52b9d2d-fcbf-4971-a130-8f247c796b49', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d52b9d2d-fcbf-4971-a130-8f247c796b49', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('d52b9d2d-fcbf-4971-a130-8f247c796b49', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('2f381d78-5b8d-4141-ac75-ed1a79d8d32b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('2f381d78-5b8d-4141-ac75-ed1a79d8d32b', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('2f381d78-5b8d-4141-ac75-ed1a79d8d32b', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('334c9858-805b-4009-b2ee-f41675423704', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('334c9858-805b-4009-b2ee-f41675423704', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('334c9858-805b-4009-b2ee-f41675423704', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('e7e4d14c-7d5a-42a6-986b-5505fa5432b1', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e7e4d14c-7d5a-42a6-986b-5505fa5432b1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('f58a4944-62f0-4f47-825d-9476cd4433e8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f58a4944-62f0-4f47-825d-9476cd4433e8', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3699b254-0664-4b07-9e7a-d968bdad3df8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3699b254-0664-4b07-9e7a-d968bdad3df8', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3081cb26-994c-4e00-ae3e-a82637769dd0', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3081cb26-994c-4e00-ae3e-a82637769dd0', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3081cb26-994c-4e00-ae3e-a82637769dd0', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('7671b352-cec6-4316-b98a-437d4c9beb50', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('7671b352-cec6-4316-b98a-437d4c9beb50', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('7671b352-cec6-4316-b98a-437d4c9beb50', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('dd571a9c-e5f6-419b-bb83-3de8000c65f8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('dd571a9c-e5f6-419b-bb83-3de8000c65f8', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('dd571a9c-e5f6-419b-bb83-3de8000c65f8', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('9aa56e87-5d61-4c77-b350-22f7bd22dc77', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('9aa56e87-5d61-4c77-b350-22f7bd22dc77', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('9aa56e87-5d61-4c77-b350-22f7bd22dc77', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('75fd9f90-1839-4625-8edc-1583f9d237c7', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('75fd9f90-1839-4625-8edc-1583f9d237c7', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('75fd9f90-1839-4625-8edc-1583f9d237c7', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('e036bf2e-0de5-4061-b86b-78a9ac863f82', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e036bf2e-0de5-4061-b86b-78a9ac863f82', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('ffb8a4b5-4a88-47db-ba96-466cabb4782d', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('ffb8a4b5-4a88-47db-ba96-466cabb4782d', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1f83de5f-37aa-49d9-81fb-409e19ec3376', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1f83de5f-37aa-49d9-81fb-409e19ec3376', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1f83de5f-37aa-49d9-81fb-409e19ec3376', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('8fbf8034-afbf-4040-9ec5-ec032802d961', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('8fbf8034-afbf-4040-9ec5-ec032802d961', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('8fbf8034-afbf-4040-9ec5-ec032802d961', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('f4697e9b-4da9-43aa-ad21-6b9e10113314', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f4697e9b-4da9-43aa-ad21-6b9e10113314', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f4697e9b-4da9-43aa-ad21-6b9e10113314', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('3c13a0ee-606c-44e4-86b2-b73a965d3299', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3c13a0ee-606c-44e4-86b2-b73a965d3299', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3c13a0ee-606c-44e4-86b2-b73a965d3299', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('b2ace36e-f791-4587-a1e5-466e6df5fb35', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('b2ace36e-f791-4587-a1e5-466e6df5fb35', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('b2ace36e-f791-4587-a1e5-466e6df5fb35', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6e375a5a-2cc1-456f-9323-7ead1e0d485f', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6e375a5a-2cc1-456f-9323-7ead1e0d485f', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6e375a5a-2cc1-456f-9323-7ead1e0d485f', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('c5df37e4-6b8d-45a8-b005-327efe82b248', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('c5df37e4-6b8d-45a8-b005-327efe82b248', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('032504f4-ea20-445c-a3e1-4d951148847e', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('032504f4-ea20-445c-a3e1-4d951148847e', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6dab14c3-5ac0-4377-99e3-eaefadf7d47c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6dab14c3-5ac0-4377-99e3-eaefadf7d47c', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3473998a-007f-450e-82c7-cc0bcf5e47b0', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3473998a-007f-450e-82c7-cc0bcf5e47b0', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3473998a-007f-450e-82c7-cc0bcf5e47b0', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('56d220d0-0834-442f-a089-982de60c31a3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('56d220d0-0834-442f-a089-982de60c31a3', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('56d220d0-0834-442f-a089-982de60c31a3', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('090910ec-4835-4119-8494-cf35d3d421b4', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('090910ec-4835-4119-8494-cf35d3d421b4', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('090910ec-4835-4119-8494-cf35d3d421b4', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6f603f25-df06-48a1-b072-5d9f813f1d28', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6f603f25-df06-48a1-b072-5d9f813f1d28', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6f603f25-df06-48a1-b072-5d9f813f1d28', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('d7b29718-8706-48c4-a971-080ad4a9d566', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d7b29718-8706-48c4-a971-080ad4a9d566', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('d7b29718-8706-48c4-a971-080ad4a9d566', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('b23103d8-b4e5-4997-b762-5e26299b62dd', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('b23103d8-b4e5-4997-b762-5e26299b62dd', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('b23103d8-b4e5-4997-b762-5e26299b62dd', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('5201565d-e810-4525-bd7e-cfab2a376e1f', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('5201565d-e810-4525-bd7e-cfab2a376e1f', 'true', 'include.in.token.scope');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('9661ac63-5b4d-4d7a-a838-f590aba9f920', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('d0d12bd8-0628-453b-8827-280cb9c1bd5b', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('1479f416-834e-40dd-b0cd-1417612491bf', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('ab45847f-eb1d-4268-94ca-9c5577f34d7e', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('7bcaac54-5284-430e-8c81-177548e6d2dc', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('b1a078e9-978e-4dd2-810d-3566a425c04a', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('13d781d1-3cd5-4139-ab26-239c43ae3d30', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.client_scope_client VALUES ('e128d539-065f-42ce-a255-4999494942d6', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('20f0ec1d-a977-4389-bac0-5d024b7e5681', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('da53a5a0-0044-4fe9-b20f-5d5bf02913c4', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('f87e6f05-bfe1-420d-9a97-afaa4a8f024e', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('46354b69-85ae-41a0-a35e-49682ac1a259', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.client_scope_client VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('39b9946d-2797-4153-bd7f-ab3d436416d7', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('255a3ccb-c2d7-4f82-8be5-6014ee0460e7', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('8a612982-28db-42e3-9709-70b705e8238c', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('f325300e-dbb1-4d03-9b37-531a5e57142f', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.client_scope_client VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.client_scope_client VALUES ('d5d8ec7b-56e9-4fb9-adeb-79efa40b0273', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('b1ce8b2d-0175-4df9-91bb-e9acc6bfc54f', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('54d85bbb-c996-49a2-ae95-a5753ee96302', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('f9247574-9b2b-4ee3-b708-5f7f7e700396', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);
INSERT INTO public.client_scope_client VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_role_mapping VALUES ('69c8a637-b515-497c-b520-75f13b2a7921', 'cc936d10-11d6-4455-a701-5e91bbccf24d');
INSERT INTO public.client_scope_role_mapping VALUES ('22707625-d41e-497c-bace-e7a813aaa540', '9c020280-88eb-46f1-81a6-431ee2962be6');
INSERT INTO public.client_scope_role_mapping VALUES ('f58a4944-62f0-4f47-825d-9476cd4433e8', '6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9');
INSERT INTO public.client_scope_role_mapping VALUES ('43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', 'ba529c8b-25a6-4ee5-809a-3850f0c1489e');
INSERT INTO public.client_scope_role_mapping VALUES ('032504f4-ea20-445c-a3e1-4d951148847e', '603d02e8-11c0-40fc-a29f-ce0768218ed9');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.component VALUES ('44b97d93-ef42-445d-bfb0-1fb67b6db890', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('dca42cc0-8e12-4fb8-a535-c132b0ce273f', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('05b1bf23-ad74-4a16-9493-619cc2f2defb', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('6b7b0c0d-f038-46a8-86a7-fe205c7b87b1', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('af93e9ee-2651-40c2-abda-54078dae0fae', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('496adc40-cea9-478c-a2a2-ada547efe838', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('32c094c2-5da3-41d3-a5a6-d78ecf9ed154', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('84d0d377-3447-46c7-87b3-f3e29ffa36e0', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('dbe9c317-2536-48fc-9724-fd6e7b4e3efc', 'rsa-generated', 'FRONT', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'FRONT', NULL);
INSERT INTO public.component VALUES ('87d7076a-4b9f-4237-aa98-72898b76c26c', 'hmac-generated', 'FRONT', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'FRONT', NULL);
INSERT INTO public.component VALUES ('1fb2807f-bf0f-4f56-8354-15c20ea39c67', 'aes-generated', 'FRONT', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'FRONT', NULL);
INSERT INTO public.component VALUES ('04d772e3-d118-419b-ab2d-9bb4c6f8bcfb', 'Trusted Hosts', 'FRONT', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('87afbe85-0aa7-4040-a946-4542b0739c90', 'Consent Required', 'FRONT', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('c86399d7-1fa8-48ae-a418-18151203fb5e', 'Full Scope Disabled', 'FRONT', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('d8275940-dc06-43f3-aff1-63897724d34c', 'Max Clients Limit', 'FRONT', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'Allowed Protocol Mapper Types', 'FRONT', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('6a046e6f-7f29-499b-acc6-6a78f776120e', 'Allowed Client Scopes', 'FRONT', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'anonymous');
INSERT INTO public.component VALUES ('6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'Allowed Protocol Mapper Types', 'FRONT', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'authenticated');
INSERT INTO public.component VALUES ('ec716e8b-3bdc-495f-bb7e-095b7c923084', 'Allowed Client Scopes', 'FRONT', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'FRONT', 'authenticated');
INSERT INTO public.component VALUES ('78a19b0b-4345-4f75-8246-c350344f565b', 'rsa-generated', 'PRIVATE', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'PRIVATE', NULL);
INSERT INTO public.component VALUES ('7dce389d-6e9e-4ff7-b441-75c52a0fd124', 'hmac-generated', 'PRIVATE', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'PRIVATE', NULL);
INSERT INTO public.component VALUES ('3d882602-b88d-4c46-96e7-f1a5dcd9acc5', 'aes-generated', 'PRIVATE', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'PRIVATE', NULL);
INSERT INTO public.component VALUES ('98cbc48f-7be1-4690-bc88-d2ab5d3b1329', 'Trusted Hosts', 'PRIVATE', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('8972d817-dcf6-41b2-916d-242a7bf9245d', 'Consent Required', 'PRIVATE', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('0cb5f143-3919-4161-adbc-4224919658c4', 'Full Scope Disabled', 'PRIVATE', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('fd7f039d-6b0b-4cb3-941f-ce9378cc99f5', 'Max Clients Limit', 'PRIVATE', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('9fa478a6-8f33-431e-a1e2-880e9cb02024', 'Allowed Protocol Mapper Types', 'PRIVATE', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('9233e801-4ed1-46b7-98ac-ebf6d687f2b5', 'Allowed Client Scopes', 'PRIVATE', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'anonymous');
INSERT INTO public.component VALUES ('ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'Allowed Protocol Mapper Types', 'PRIVATE', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'authenticated');
INSERT INTO public.component VALUES ('30254ef1-684d-448c-84b7-40f868804690', 'Allowed Client Scopes', 'PRIVATE', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PRIVATE', 'authenticated');
INSERT INTO public.component VALUES ('2b459910-199f-4309-9d92-989e3b696f8a', 'rsa-generated', 'MULTIPLE-1', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-1', NULL);
INSERT INTO public.component VALUES ('4a3645cf-76f6-479a-a121-f5e9f919e51b', 'hmac-generated', 'MULTIPLE-1', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-1', NULL);
INSERT INTO public.component VALUES ('290f1b26-305b-4aa7-a830-65edf392dd86', 'aes-generated', 'MULTIPLE-1', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-1', NULL);
INSERT INTO public.component VALUES ('5244e995-a019-44bb-97c1-eb2348e2fe65', 'Trusted Hosts', 'MULTIPLE-1', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('f74ec416-43e3-4d39-9dff-25908aba6c4d', 'Consent Required', 'MULTIPLE-1', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('b05661fd-8cdf-4fd9-90d4-8aa150dfd05d', 'Full Scope Disabled', 'MULTIPLE-1', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('4028c7c3-afd2-448c-a15b-cd70c43ede62', 'Max Clients Limit', 'MULTIPLE-1', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('90eee2d9-e7a3-4538-9111-dfd72b24dade', 'Allowed Protocol Mapper Types', 'MULTIPLE-1', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('27d53b1f-7f9a-4ff1-96c8-35fb3048538f', 'Allowed Client Scopes', 'MULTIPLE-1', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'anonymous');
INSERT INTO public.component VALUES ('504bb609-1016-461b-91b2-9dcad2e5f9f9', 'Allowed Protocol Mapper Types', 'MULTIPLE-1', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'authenticated');
INSERT INTO public.component VALUES ('0d6d6353-a086-4e75-9bdc-c37d480fcd2c', 'Allowed Client Scopes', 'MULTIPLE-1', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-1', 'authenticated');
INSERT INTO public.component VALUES ('0b47b324-7316-4951-8444-728451908299', 'rsa-generated', 'MULTIPLE-2', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-2', NULL);
INSERT INTO public.component VALUES ('537dd1b4-5b95-46d5-add4-85f0ad4f6227', 'hmac-generated', 'MULTIPLE-2', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-2', NULL);
INSERT INTO public.component VALUES ('1e34c5e8-6e79-4e3f-bb53-3ab27d025512', 'aes-generated', 'MULTIPLE-2', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'MULTIPLE-2', NULL);
INSERT INTO public.component VALUES ('2f191836-178f-4579-8afc-dffa7cdcc6aa', 'Trusted Hosts', 'MULTIPLE-2', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('b0118083-e962-4b02-ba14-c72f0688bd1b', 'Consent Required', 'MULTIPLE-2', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('56123850-0ba5-4f09-aaff-b31d69b8bd8f', 'Full Scope Disabled', 'MULTIPLE-2', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('3ef8ac27-61cf-4dd9-ae29-fc7cb4e24888', 'Max Clients Limit', 'MULTIPLE-2', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'Allowed Protocol Mapper Types', 'MULTIPLE-2', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('570dbd36-699a-48a1-b13b-1feb4dbdb4ca', 'Allowed Client Scopes', 'MULTIPLE-2', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'anonymous');
INSERT INTO public.component VALUES ('a136fb74-bcc6-411f-934e-b0231c51d16d', 'Allowed Protocol Mapper Types', 'MULTIPLE-2', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'authenticated');
INSERT INTO public.component VALUES ('ce221818-f186-45a9-9316-9d2cfa901b5f', 'Allowed Client Scopes', 'MULTIPLE-2', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'MULTIPLE-2', 'authenticated');


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.component_config VALUES ('8962085f-9404-4f92-99bc-394da27e04b0', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('80ed31a5-3acd-4358-aaf2-d702aaa9dc2b', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('7753b1f0-1189-4e32-a755-7361bb7f2cfc', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('02ad0b6d-ff3d-41e4-922e-f40a3424ae88', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('5d2f5542-e9aa-4348-9711-552f686746cb', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('c0fd3df0-56ca-44f1-803c-d882a7a3d029', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('fb5e95df-4e72-4d07-a87e-0fffaddece92', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('8b7dffea-1859-4f47-a638-39dfaf10a295', 'c8fd6bf6-3f33-4d91-bfb2-fb3886decf41', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('1b983c25-e158-44a2-b5a9-78590ff5b6b6', 'af93e9ee-2651-40c2-abda-54078dae0fae', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('972b1c40-4b48-47f5-a7ee-429c65e29f9c', '496adc40-cea9-478c-a2a2-ada547efe838', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('ed32a34a-c556-42d9-802d-17e49db7a579', '6b7b0c0d-f038-46a8-86a7-fe205c7b87b1', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('22735a64-7c01-4de9-81e1-bd3aec1a71b6', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('2de53737-8bf4-4d0d-b0a9-428ed99978a3', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('7ff080e3-5692-4c3e-bce0-4434e793ed3f', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('f80b6392-11a7-463c-ae84-6eb707678857', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('f8af0a2b-708f-469e-a0d1-f1c1fac03c15', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('aaad4bbc-1a2c-4a1d-a247-9e9406e2496c', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('2ef0d192-f90a-4925-8c44-c5d25861484a', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('f190bc9a-1498-4c21-a847-47b650b79d13', 'b4864aac-7aa8-4e5a-97f8-789a7fa695fe', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('c842887e-39ef-431b-9ad9-f9e8547f453b', '44b97d93-ef42-445d-bfb0-1fb67b6db890', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('fad02587-385d-4640-bfab-4fa6191d29af', '44b97d93-ef42-445d-bfb0-1fb67b6db890', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('3c54ed7e-e925-425d-a6f2-81dc8336ed26', '32c094c2-5da3-41d3-a5a6-d78ecf9ed154', 'secret', '9J4pj_RQlyGg710eCqOAnWOSkgNEQEZKXObqurtlZHyjS9_aznqDzAOIlNvfgCylFdeudYvepuAJP2RzvBPbOQ');
INSERT INTO public.component_config VALUES ('f6721e27-b048-4921-a2ad-bdb742be48a5', '32c094c2-5da3-41d3-a5a6-d78ecf9ed154', 'priority', '-100');
INSERT INTO public.component_config VALUES ('213208fb-6fb0-497a-ab7a-852d3886a1c6', '32c094c2-5da3-41d3-a5a6-d78ecf9ed154', 'kid', 'd4ea3376-aee5-4b06-b471-7f344c270566');
INSERT INTO public.component_config VALUES ('42f24d6c-0669-4ff4-a3a9-92d511b5a989', '32c094c2-5da3-41d3-a5a6-d78ecf9ed154', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('94e27f8e-53ed-40c4-a15d-50ddb06b5651', '84d0d377-3447-46c7-87b3-f3e29ffa36e0', 'certificate', 'MIICmzCCAYMCBgF4F0DTTTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwMzA5MTM0ODQ3WhcNMzEwMzA5MTM1MDI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCVfTS1uFVazDaVPyCkzmhvpWlgRYdpj+ZPbmEsbDui+YaA3K0FotLRoSYk6G9hVJ89LG1zAVZzNMMskos9lw+YrW0DnYeNf+Hh8jmX7O9Y6XnSjPh9bPW9bcsLOvHTxYlxiYZ/EHZfuxJJTp42TTfFVUsuHfT1BWf1cc45YzyhKu+1WN40q2DZOSjWif/ybhgvt3ZnHX897khhVm1LIEFo+SyDF/Y71uwbP4/+1p8gpDma67MDSay+Ym5JIXUqjPyGcDPs4Gbl+SOx2+ra56KHwL+wNnioRhsGhHM5pQxFJWdMUs/E5lRj0vkilAlGUCgSg86m+U0aBLSvpuourNIfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAE6KNh41Gu9kp3wuLL4rC2II+DD6QB47uLMU4wgtYP9scw45PJlTbl08AWUaCownFdWE6qjFHuuLVtHL0KS0y+EpLI8peGOLBtYLDr0FVWFyPVmh2keTqtC+VmTZ5x0wDvSFgJ036jXYtHTowP92CAuJq9GAnL3ntQZ9qdz/O1UdKGUJitJsd+WhdsR6oNm1pMKel3OUOFl4rqRbjfHPl7Ek6CpIYy/RsOiGnurSVUsmeqD3YsqnVp0+0j/MrH6pvSLRTTSnUx1qo3PkC6iKooFvxnV32wu/aPu/iig2Fjbae1dz0w5F9yk3XfCj9hC0d/JRvTq8HNn53msm84CKdVY=');
INSERT INTO public.component_config VALUES ('35eba962-1613-4871-897e-9447bcd3a596', '84d0d377-3447-46c7-87b3-f3e29ffa36e0', 'privateKey', 'MIIEowIBAAKCAQEAlX00tbhVWsw2lT8gpM5ob6VpYEWHaY/mT25hLGw7ovmGgNytBaLS0aEmJOhvYVSfPSxtcwFWczTDLJKLPZcPmK1tA52HjX/h4fI5l+zvWOl50oz4fWz1vW3LCzrx08WJcYmGfxB2X7sSSU6eNk03xVVLLh309QVn9XHOOWM8oSrvtVjeNKtg2Tko1on/8m4YL7d2Zx1/Pe5IYVZtSyBBaPksgxf2O9bsGz+P/tafIKQ5muuzA0msvmJuSSF1Koz8hnAz7OBm5fkjsdvq2ueih8C/sDZ4qEYbBoRzOaUMRSVnTFLPxOZUY9L5IpQJRlAoEoPOpvlNGgS0r6bqLqzSHwIDAQABAoIBAGEvCstw0Ry8UmfoqGI8Riz/DmimCwiXopTVH5tvqb2kFstDq8BUQFZEO7YW3gIar4NnlKgFoJw5GwGpK5iY0mzholONYAifsMvhW4vnXxsgfjBhsVJpOcEy1aOxaHHSpC4JyERnAW3vAk5iK/0FalKBxuRuWUfJgfJRUE6Cs3Han2DwVu5VbH9aOkud9Z7lQ3Am1FDlAY8x2/ZBDshJZyryKV1o0Lh27WMIadhQvnzggy/BPSyFg8u23vC/w2UXdbNX6jbcOI26OIgMy/MjmQ7IwkCKLsUKzJ3FFYf+Zc0MgmnAISLY5IEmITSkhGoe+uNXQoynlyhkuESwQ8zqipECgYEA/F5Nm/VQNxzJQsA0/MmrohS0SjoVJ36lDyS4gD5hkvGLB36gaLs/WrxbhdSCj4o6VLQB+duVZuvf4Uc7Cr2dB6TjKpznMUVB4RxG6yxid0Oxtm6MtUuo9EaFi4h/kMowtDlSCDMBLMH7j8+66byT0hBetFo9MvzlSRdXuZpS9/sCgYEAl6PoLoLp/j3YQdzXPv/JveAE1xKTNaEmkkVMk3p1sWia7i+hnJyzv7Jf6ygpaEzKfLNCz/cH5dKKwSny43sEJwwthvhtJ2NKuF/JGtc5i1cVN/7C60Zx52eNQGtvi32JpHviigxu5gfZxtLti7+A9yrn77lFsuMXzCfi44r5wS0CgYEArgY5bjoTPm3TOvxfjZFjkTjFugmjXMCwAWlI8OYTUsjNHjXrV00HuwH3+qk3/tNKte4LDsiklXxBvY7o39cw2XySSWg45HjlnN1q6fCJVcSQX0SMMtghgZC/tiBCFw3V1/FO5+iD/uElH14XfeZT6J7xL1yqpuZNFcHK9Gm+nNECgYB4p1jJES7/NNQJ6550KO+rHUCco9HvfO6EuZDpUymr4/BKDioHw4Mdxt6c69Kug1Mljzhc4lAtY601bpwstaejLgRXfPjUuyMrukL4EUFfBgYDDLionN9qYLE6DYGuOk+3ST8B2kyuyJZVpWSOqewCPehXjFHRuPEpZp8Xr29zbQKBgDtZ258J/yskNEX6sqqEj3bbapQU9P0SJel5wAJGzVLqcy11TOi65MtGyeCNZubmkPiunJI2g4r8htozF6eXdj4pY8Fmi9tVIaXNrUQ/l63zOiP2KGKQwhJ70oDfF1a5BouzAs6fzDIRGZHXe+MrD1MJjSKxZK5t0Q7TGsSbE1UO');
INSERT INTO public.component_config VALUES ('609f44e5-9fd3-4a6f-8d09-5ad846bbd1fd', '84d0d377-3447-46c7-87b3-f3e29ffa36e0', 'algorithm', 'RS256');
INSERT INTO public.component_config VALUES ('ef4aeff9-c629-409b-bd86-7b6a9322e3dd', '84d0d377-3447-46c7-87b3-f3e29ffa36e0', 'priority', '-100');
INSERT INTO public.component_config VALUES ('b09648fd-d448-4a36-a62a-bc7af7fdc989', 'dbe9c317-2536-48fc-9724-fd6e7b4e3efc', 'privateKey', 'MIIEowIBAAKCAQEAhWT6PNJ8tbaSG6QTw2jEwBH6g+MLqNIiDaBcOIS+oqE47Z2PKeffjNikNWQCcNT3CuCK7g0oFnIjq2zlZVMiVwPgjp74bY1IEvfdB7OtVdtH9g6vkpRWrI5sUobE1dULQCsNvmOQjkecloMZKcQK+OepQJq+PNVETh4tNj6jrrQZDfkta4iB9M4py96210zN5U3Ziu7VAPhjsarzBqpH+PNxyHxhAKty2xTRMAmDSe2TKUFfbMxoDz2KUWoJ2vCE06PtKkChcBM0AG7QIatNRZ28AJPXNJNEocKQZq0YcsJJxSWv0QnDFqZxnzFE5MCLR0OuDUIQjsBYQ/cdiETnZQIDAQABAoIBADsI8WYxkVeqMQdimgyFNW37hu8PcH2KYd+99JJezS+UQmmGrXFSWTEwP5wRYrMkzSBXN6Ua1X75jKe1TeCF5lC0OpFj8XYqbJdYcs2Ry0iP/0z6OuGYHLPJZE8xrbMk0hHX/AEidztAniBObLh7No/plpIs6bxqdgxMdp3nIvGRv6FYY0gatx3rwdeEBaluJY3ZGb8RQCKyxLOzN3NOeSFMQ+XUQf3JRWMVA1alPaI6YjM7DSkXBHJDyq6nR4i0f8gucm5lzccmclCQgMvwoxhYxIeaP0NmwRbRy31Pew7wbEhp3usKQoQhJnVeKY1Czf9Dsjx2oLMLJ5COw/p9TwECgYEA+yZHYyRRkB98qvLAXFtRHsgTXJLEI8wcQGyj8VRtXV8Fe/B+zXCScOsFKgEViVKx5gU8P52raOsAj7oZNkbsTkoNXKj8YKCBLETD+3McXR2RQw21MTYTgM3hnxU4zekUor4+KIFfU+bxpKthSV7iuKJsx2H6QLVOS1oRz0OZIRUCgYEAh/h/7uvBfX8BovjXfCclUXLkNIVlw+s47QTFqeeRSuqpLLmpaOVU5JiEhzMdLOqO7ECtUOryspaFGX9BYPECwt7m3IKbLHdpIi+D126JcGCS8Xp0G0OuFNb+03UoPWsJqlaa6+x7dtyiqoHgTZz9Chctz1SrJriu7esBQ0/+IRECgYEA87kHB/gjytgzlHW1JStdAqEo4Opwu0iFliOXyUekRjtDSC5v75AyHLCGN2gL7VK53z3vZNDumgeMaO4xL1IOWj9UzjoTiPXZxQsKoYbo3Jgn8slnr9UJgjLJpCblFDX/15sFGSvLRdHVaHcEFz6kiIbfR3IWeBs6WreSlu/Dt60CgYBqHQtqoF7O2/GhCGbTI5HCMNHcE0dKUSaKAzFn2arQNrZ0iyilDmTkSgsToFZimWOVCRy5i8KAkWuqbF/Pkge/oUm2Sc9kMoTAAyj3VfK42wWSoyg9puISrX8N897Fn+VZJGGfQV1Rc/sW6mjs6VmpKFG9/qvbekI6ty6zI5iGoQKBgBI9xqw66s/8LXcT02kcltTuOTK1OSqHrcyOxeZWrDk1dK/ipyG5an0cENQCrns8qiz1nAA6uQN3D9ELIFdqtn7wITan5iyLqmGKVoYn55JqeqYx8gMBnTcmayU6BKy93CMVaiBddNESzh8DtQjMvv0qbJRsmX7JcSLToomdTTQS');
INSERT INTO public.component_config VALUES ('b6ec3bdb-2101-42b7-b51a-1360663f598e', 'dbe9c317-2536-48fc-9724-fd6e7b4e3efc', 'certificate', 'MIICmTCCAYECBgF4F0gFgzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVGUk9OVDAeFw0yMTAzMDkxMzU2MzlaFw0zMTAzMDkxMzU4MTlaMBAxDjAMBgNVBAMMBUZST05UMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhWT6PNJ8tbaSG6QTw2jEwBH6g+MLqNIiDaBcOIS+oqE47Z2PKeffjNikNWQCcNT3CuCK7g0oFnIjq2zlZVMiVwPgjp74bY1IEvfdB7OtVdtH9g6vkpRWrI5sUobE1dULQCsNvmOQjkecloMZKcQK+OepQJq+PNVETh4tNj6jrrQZDfkta4iB9M4py96210zN5U3Ziu7VAPhjsarzBqpH+PNxyHxhAKty2xTRMAmDSe2TKUFfbMxoDz2KUWoJ2vCE06PtKkChcBM0AG7QIatNRZ28AJPXNJNEocKQZq0YcsJJxSWv0QnDFqZxnzFE5MCLR0OuDUIQjsBYQ/cdiETnZQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBu8DT2ylncJ2ryS+plXcyYZq2jGBG+h6PjnV3eOfiF5Cr1DBGNBSi6vf724cgsKKrWS23OCfC/5P/3hPWhBe11+Lks9WF0fvqakzZ0h5/PBqWontlptAI8iQyveutUtIk9gY2JF57fQmvHiguLhEX9FFPUX+I2J08ac3FapvZ9yYd3uf2HgFCFolLlY05knm3zBwaT4XIMHTMJtOMdrF3OYZlnA9r+5rHDx5LCEEVUNEihFo3YdF6fvgcxWVmurdxD1bR6hNqVCtnABxUvzmr2eR4bCeGdkxC8gRtgKGB30MUuWli7r8Xw3mXPKov356UbLuhjOkANxf3cEvO3mlTH');
INSERT INTO public.component_config VALUES ('ccffa814-e115-449a-a3c5-5abcc66008c3', 'dbe9c317-2536-48fc-9724-fd6e7b4e3efc', 'priority', '100');
INSERT INTO public.component_config VALUES ('c406b1a9-71d3-46be-831e-013a3a76034d', '87d7076a-4b9f-4237-aa98-72898b76c26c', 'priority', '100');
INSERT INTO public.component_config VALUES ('2858437b-ba6c-4348-92ac-2d1b5a6a1e6e', '87d7076a-4b9f-4237-aa98-72898b76c26c', 'secret', 'cSTD3EaBogfPKjY9pnZX_b3bXbrGKosdlvSP1u3pwzmbV43fTEkVWyBGvhw7eRnsRG0m2CVtR5Q3qsuv6tjkXg');
INSERT INTO public.component_config VALUES ('ecb398b8-4a82-4e55-9658-4e283757c031', '87d7076a-4b9f-4237-aa98-72898b76c26c', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('91d6492b-2b21-4866-92a9-4df89ec939fd', '87d7076a-4b9f-4237-aa98-72898b76c26c', 'kid', '3bf3e10e-a6cd-4b70-a28d-4e061c182b1b');
INSERT INTO public.component_config VALUES ('6a90e2f1-f492-4355-b4bb-92b7a2f35138', '1fb2807f-bf0f-4f56-8354-15c20ea39c67', 'priority', '100');
INSERT INTO public.component_config VALUES ('05975a66-4abf-4dd4-ba4d-fffad74fff25', '1fb2807f-bf0f-4f56-8354-15c20ea39c67', 'secret', 'fG9c9QoYuzXC9hd9dTbi4w');
INSERT INTO public.component_config VALUES ('159994a9-73c4-4e6f-8dfb-832572576425', '1fb2807f-bf0f-4f56-8354-15c20ea39c67', 'kid', 'bd7c2c73-b3cb-4795-a212-a035fd637b57');
INSERT INTO public.component_config VALUES ('4903906b-c1b8-4c99-879f-8bd878dfcefd', '04d772e3-d118-419b-ab2d-9bb4c6f8bcfb', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('7b4e2c1f-3324-4c83-a310-000a454930ff', '04d772e3-d118-419b-ab2d-9bb4c6f8bcfb', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('26abbda1-d43d-4160-a0ca-66edbccf7b0f', 'd8275940-dc06-43f3-aff1-63897724d34c', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('95895efd-6e1b-42a0-98a4-f77e2bcd6650', 'ec716e8b-3bdc-495f-bb7e-095b7c923084', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('937b7a30-ccf5-4dee-a952-5640b7bd6556', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('056f0d2a-dfbe-4db3-9640-656d466b89f4', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('a26fcaf0-cb1a-4503-9c84-9867079df019', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('9d0c42a2-73c3-48f4-a7f8-a6b0e343f65e', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('3eaf866e-bad8-4d5c-8dee-70730e48dc19', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('6728e2dc-c1dc-47de-93e0-c2eb00743eb5', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('a9e7978c-b550-446e-bfea-ed4d4951a725', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('6595ee01-860e-4bb2-9bbe-61f83d8615e9', '6dd8c38a-72dc-452e-9e69-7611e5bce3a9', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('a58f1d9e-853d-437c-83d9-251a20ebf62b', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('7979dd44-0084-49d6-85be-3cb607633720', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('588bb8df-7e70-4183-adc4-18fe960f192b', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('5ac2b266-6657-4b3f-a087-2902f61f5002', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('b8d69cfd-55e6-4075-8b50-8f506dd388ef', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('c036f951-f6cb-4370-83ff-807c90e3e5dc', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('f79d787a-242e-412d-b345-e976d35f6291', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('955ad2cc-f744-46ef-ab57-595dc7089d24', '9aec75d4-f7a4-42e6-a937-f0f112af1b45', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('65e23caa-a20f-44b4-8f9e-7a5df08b52c2', '6a046e6f-7f29-499b-acc6-6a78f776120e', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('94e34f43-2142-4685-a91e-5098ae3cb01f', '7dce389d-6e9e-4ff7-b441-75c52a0fd124', 'secret', 'G8g7yAqejUvo8vO0Wd-l_k5LTYw3SdBgHuxlgfdeQqNDNDImWlJ2lkG1CcaSSr7iYg7IQTRv8Actir_ba_iv4w');
INSERT INTO public.component_config VALUES ('43e9f99b-6098-4b3f-9408-e420bb2bee0a', '7dce389d-6e9e-4ff7-b441-75c52a0fd124', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('78443049-325e-4bae-9cb2-335336159cfc', '7dce389d-6e9e-4ff7-b441-75c52a0fd124', 'kid', '3696a016-7587-4da9-bb08-d03ae664a7f7');
INSERT INTO public.component_config VALUES ('26cafe9a-ceac-4f69-b207-81b62925a1f4', '7dce389d-6e9e-4ff7-b441-75c52a0fd124', 'priority', '100');
INSERT INTO public.component_config VALUES ('1143e8e7-c02d-47f0-b877-72dfab479ced', '3d882602-b88d-4c46-96e7-f1a5dcd9acc5', 'kid', '28367575-866f-4431-9c94-ae090f6348d7');
INSERT INTO public.component_config VALUES ('06852f87-5642-4278-ba75-0242f61839fc', '3d882602-b88d-4c46-96e7-f1a5dcd9acc5', 'secret', 'ybLau8ftPFw3NgCj9yC4ig');
INSERT INTO public.component_config VALUES ('e210ac64-730a-4e9c-834f-86e9279f5847', '3d882602-b88d-4c46-96e7-f1a5dcd9acc5', 'priority', '100');
INSERT INTO public.component_config VALUES ('3137928d-a872-43f2-a8bf-3bc3688ce96e', '78a19b0b-4345-4f75-8246-c350344f565b', 'privateKey', 'MIIEowIBAAKCAQEAvcWDLod29I3RcMRdL1lStHl6zl5Rg/EQqFdZDvlgM0R3e/LlH4zuvA93PsMwW6THo03qxFzuq+PTaPUuOVadbv7mz5ZQpFqn1pbnTX8AygvwdxMffcoqUTBARuAhyMUOLn/UAV2f1G9VbQ5gQMZDmUB9TefTBsZOnElmTvfETHFVFAvKTX7cPkbYgv6i6kXB2W6sTxc3h7RD0DKXR7COXme4pykhsqjOLrItWsciRFBPw/XqDMQ0zlELzD9Se4RMtatqaoWYrqZu/Z4fGjeHgv96DGFw7xEp8IwWRoE2iR//Ab4wwv2NaIwk88OBFcM3N5tItVfftftvLKfoas02dwIDAQABAoIBAAoP9gO6lRkkh+11zAcdsl/1bQiSQbpARwTWFNfRa0NspvVAjNueam44V7dRPDgvxZIoKIGe99zPaL9Q+NF7gT+Ibo6lRsNgNzQOrlcSm+UauvZlYi8WUCYb69yWN9Rgdn8KsiAcacQm3x24PGxS1vTCUaKW3z6ltzdcQPuA8byn0lp7N0Xj7DKcykn0CUvuf9WPeSmh0fpbceXbBXGg7slMlz/EqfAfin7XmkxiusFla8fa6fWyjeGJxXGnTe1UsK5Al9K/EcYRXysZ63qUhPJZznZUF1DJizzPgveRQSru3kWRLu+Jb2ASIKdXu6j0RK9LqJ/urkeUDt2fZ1M8SJkCgYEA5FNsWTrAv+3SiqtARW3lBjec11WNfBF440in2eSB2v6i1mFFn/bAL3XnLBRqqXjQMVak+9VTzihkQusdLBpTDQKozdZggGloUZqNFzKEbbBl+v4/kitl33DO4dnBAwjoVxEOuWyz+9dP4F9O1QYNEgSrrLIz4cqV/KraLzUGxtsCgYEA1MXPtokKbN5qXbNTv2T3VGrXAljd9vkvM/ACuYI+Nts17O22lx0d1lBSsWseug5z4HN0Arml6m9veZSJPmwygBcbNidX9jmqdu8IACILr5n3XU4JSno7PRCqJBCAM8gdosBTMgj7MPMtoMdoADboop2oOt92VpkVQzwqn79FO5UCgYB025WKnZ1lHc0yF6/PWQ1sfy4Qr8K4CyE6AkeWJ3Omp8ijvCksU9fM8qUcVF662hCED/pkwawgyV93OGo31klHUWMf5maBknFHwrgPdVV95lhre5EBuKBtGYlo4k/8w6RWW26TzGTZsjs5dM4eDPjHjghnXNVc7JiTNsZwfs03HQKBgQC8AEjHPZFDnsaXImOGQr0zDvAJ9+GwXn7xwkl2BnnYWJruTSA/p498lR5r+3174ldK5FiGK+lJGsuBvtgBmvKIMWJu2BalzlArpIsKKwruTvm9rL0S3KvJChd7pETS/CgLbSpVlI/2sXgIjwj634lwXiOOWXKjk8Gw1dHHsuaGfQKBgBSMDoQpKuujTVXznIU3/14O6x81lNNsWn9U0JU2tYiWh329nML80mZOLtjdRE7O9+HtZr3+dOk2CggZyy3WohKpO2SVsl2JiYTY2fAY30DWgUyuDScQWniomIegegUjKsbA1TbBV+o1kzP5SeJLynd8ss5HU332sLU38UD/Hv+Q');
INSERT INTO public.component_config VALUES ('e3454e27-9714-47fc-8818-f726db63a9e3', '78a19b0b-4345-4f75-8246-c350344f565b', 'certificate', 'MIICnTCCAYUCBgF4F1opxTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdQUklWQVRFMB4XDTIxMDMwOTE0MTYyOFoXDTMxMDMwOTE0MTgwOFowEjEQMA4GA1UEAwwHUFJJVkFURTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL3Fgy6HdvSN0XDEXS9ZUrR5es5eUYPxEKhXWQ75YDNEd3vy5R+M7rwPdz7DMFukx6NN6sRc7qvj02j1LjlWnW7+5s+WUKRap9aW501/AMoL8HcTH33KKlEwQEbgIcjFDi5/1AFdn9RvVW0OYEDGQ5lAfU3n0wbGTpxJZk73xExxVRQLyk1+3D5G2IL+oupFwdlurE8XN4e0Q9Ayl0ewjl5nuKcpIbKozi6yLVrHIkRQT8P16gzENM5RC8w/UnuETLWramqFmK6mbv2eHxo3h4L/egxhcO8RKfCMFkaBNokf/wG+MML9jWiMJPPDgRXDNzebSLVX37X7byyn6GrNNncCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAKV/z2Cdv6OGxncV1RpjRHzjaJ7BiYji02ZZXTFTJ4PmDlBOo9dX+zjiLJ4Ie7JiG/mSisskY3QYSLClpI0TSs+UlPHWs5i7TtsuLdCTecFkM/dk0IugxULLIj9Yuoz0Kg1JZbSFAUNVyFrUhqmcsfcIVvK1/dmV6UJKKRey+mqIk8Esul0lM8KfzQuYRJHksTQ3NDHY4VRiRq6d1/IXUfG9eoSlHoEJizL7ZvVHu3/DOXDembY3+565MbSUXklp5rlF90s/qge4a9k1vGiefhlKIy8Uh/IxRKybYb6j7OfUjJeMmE+GJUWA3Osghb6Zo9Bzta/fnWlSK9ynaEm8sA==');
INSERT INTO public.component_config VALUES ('61b6be9f-aed8-406c-84af-8274468fd9f0', '78a19b0b-4345-4f75-8246-c350344f565b', 'priority', '100');
INSERT INTO public.component_config VALUES ('e6c83236-4fa6-4f27-aed0-d987917c8829', '98cbc48f-7be1-4690-bc88-d2ab5d3b1329', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('f1720e93-4b70-4a4d-87b8-1a2d87f36528', '98cbc48f-7be1-4690-bc88-d2ab5d3b1329', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('bf88a59e-3ddb-4e43-bb47-c8ecb054c74b', 'fd7f039d-6b0b-4cb3-941f-ce9378cc99f5', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('acd16e3f-46f3-45c0-95df-524ecbec79e1', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('52ceec91-2cbd-4367-914f-e0f5549fc74e', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('4b00fbcb-b085-42fa-b6a9-30c3a91739e3', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('020b0d97-aa91-430b-8a2a-f1e6495b1ac7', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('6a245322-87d6-431a-89f3-9acf8cf9f79e', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('19ae1abe-2ea6-43c7-b12f-d30ad5f83aeb', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('fab64cde-7b99-4c24-a6ed-9e227c67eae7', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('3277ef89-dd58-4e03-b365-a6ace894518a', 'ced731a3-6f0c-4075-bd38-6f9eee84adeb', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('96041191-228b-4054-a0aa-80036f957eb4', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('8ffd995d-b6ef-4acd-889f-09c428d88163', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('14c16275-ea87-48da-ab01-6d7ec316eaa6', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('04765dcf-3012-4cb0-8920-561b7d1a5d0f', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('ec590f9b-4b58-4b8e-98a0-c7b0a744a959', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('64e7adde-3972-4814-8129-0ef69ac981b9', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('87e5bdc7-c2f2-46a0-9de6-ae91defb15bb', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('10c98a11-df99-4099-9031-05aae1ef12ee', '9fa478a6-8f33-431e-a1e2-880e9cb02024', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('6ec84646-8e33-4f98-942c-ee4895e7f800', '9233e801-4ed1-46b7-98ac-ebf6d687f2b5', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('6385176e-a05b-42b2-845d-b7d4c082f33c', '30254ef1-684d-448c-84b7-40f868804690', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('387e6658-6a8d-4e88-b7c3-d83b2eb60074', '4a3645cf-76f6-479a-a121-f5e9f919e51b', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('4b5071be-e2d5-4569-947a-da0ee023f6be', '4a3645cf-76f6-479a-a121-f5e9f919e51b', 'kid', 'beafc758-760d-4119-8827-8a6773b2eb92');
INSERT INTO public.component_config VALUES ('96cc97cc-76d9-4a1d-bc8b-2f6e719c0f80', '4a3645cf-76f6-479a-a121-f5e9f919e51b', 'secret', '3AjukN8ciTI80_oFJlW-XPLJmBwo2UZRj0mR2J5fNGA-o8cQb_tEC2dqquJfzaOB6Z4q8_v9ZV7yIasA0Gq2IA');
INSERT INTO public.component_config VALUES ('45c67006-14d4-478e-86a3-8fbdcbb21a25', '4a3645cf-76f6-479a-a121-f5e9f919e51b', 'priority', '100');
INSERT INTO public.component_config VALUES ('d23c0a43-1aab-425a-8a97-9d04bf51c10d', '290f1b26-305b-4aa7-a830-65edf392dd86', 'priority', '100');
INSERT INTO public.component_config VALUES ('24f8cd99-d83f-4409-a09c-ef055bad45ee', '290f1b26-305b-4aa7-a830-65edf392dd86', 'kid', '890b1403-6aa6-42a4-a0eb-20ee44b533fe');
INSERT INTO public.component_config VALUES ('493eb51e-62d9-402a-ac82-6b34d2adce5b', '290f1b26-305b-4aa7-a830-65edf392dd86', 'secret', '5dJA_CowaRqwXpVaB5SNsg');
INSERT INTO public.component_config VALUES ('41a70604-af69-43f9-971a-f384a1ed17ed', '2b459910-199f-4309-9d92-989e3b696f8a', 'privateKey', 'MIIEpQIBAAKCAQEA4Lhz1Vw8/4fXzJlHXQJgNupANmdw3c44S/L7nrQqJcGbL6Vqn8EhzJQJmT+eVT8T4N0bQW8bxSPiF+TGW/ez5tItYBFC39baik44EZx2xMBqY9hJF6HwpZAcsenmyeex08EYbhgrsueh4QOOlM4TDYwDiFw3Cum7mTkq9kZOMYFjHGvLIkhJwqOEJ/oICVUkSwtivhn0yEbZMqewRl84sY0KRp5maQkYm5yd/AC77Vx3PbcMwgYZUL1nbFD6UYR6O8227sUCDd+rQmg7Ysy07awdXyGhR3S3tXPTQgJ9p+FmncTYII+dLenBpluQtu029jRBY2shPmdsVjZfcYhSawIDAQABAoIBAQDcHnGAJhit6J9Ojzni9kfOosiBQfPBoJVud7VW8H10fF+JXUvC7ogv/zYjwbhTIjVThuGCx9X41jxKUVKnlUvIJkpCFsZdwfRRk2rCfXOtKBlOcfauynaRhkdFUqs5TNXYaQWIGe78EH51jWllgzIQi/yN3l4gN3EGFoRptdY0EAX8wXNQ90tkfwVN2YArXsLPSEjUCCl4hn2ABVTNflYw9yrnPp6E9XNz23iXRXdij8kEg8t8LU2t47Kq5qreQBP4Jarx5zR+CVLcYjnQChdkAisFUE/d5CddtZQ8ggqH4dXPIM5DOSz99Hqy2o8KTT9rEnOLKlHU4Yb9RnEjCi75AoGBAPoQt3lCWwPmrUt3vj3n6HwYwovHTC5/9gBEEEI/IrKL+RGaUs6DGj6E4mYaWm5KqcL992ai/MeT+b1U3svEgpIj+W07yjnteAt6qtsSIXMs7ep3J5va+E7D7xCUuC4regebeecV7thuSYImCzXtOSNaBQoTnjao8BJcP3Npn/XnAoGBAOYNwJwuwZew09vjPzUDb6OjXRXoM0mIJkPZIzdygERRcmkASg4TZxBh0qp/TAwx34Z0kYV+Jb/OI0t5Nfda9cxyyyW5+UTORI0pgWoFPkBSJEea7A4VpoVGDqcMeqi13P51kzUzpCtY79zkcJW5kkjg5ku4FVDV43RhebW48WbdAoGBAIySYyFWTOW3gglfieExAb7pCEwdP9UP99EUcfNbnHy0NNJRZ2VRy6oDd2WgQN+pNx83NyFKVEE5DPYCxK/VivTuJiPirX684HPLhEpcOdOOGTxpuSljAZz9heFTSOojZJjsLK3b5YVjEg2Ip1qsPSeDTjvo5VKiyzn3A3A0m0hXAoGADw49WbtRnhzLcKuJmm2UI9BwKhvdJ2XKo0wVmu5aaJ4v76E+N3ebmh3czJ2yG2Y0K7d7QpJD5C6YbrsLBhok1fF5TAnEv3UEVXyu5IJdVZZKm4kPA8j08eno0ZPmfx4PzXNiY+vyRYf3gqxMle/kG/Lj/3aXpoeo8BflADiPS90CgYEAk/FNeFQSpEjQ5FTl80IxxCdgxS5P01G9jKPWZtWZZD+QyRRQXMzlJMzOOqOSwpmFfy3KQVAZeBi7x/B2i7APYRBhBg4+dXF+BzHf1xQykDMcpnxIHFJzSlx0XWZZjrYIYz5J+lDElhTGfA0wMHgY1etIJjD2NspNERbUuuD6PIs=');
INSERT INTO public.component_config VALUES ('93197294-b100-41ac-a174-bc52cf946674', '2b459910-199f-4309-9d92-989e3b696f8a', 'certificate', 'MIICozCCAYsCBgF4Weo9WjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApNVUxUSVBMRS0xMB4XDTIxMDMyMjEyMjg0NloXDTMxMDMyMjEyMzAyNlowFTETMBEGA1UEAwwKTVVMVElQTEUtMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOC4c9VcPP+H18yZR10CYDbqQDZncN3OOEvy+560KiXBmy+lap/BIcyUCZk/nlU/E+DdG0FvG8Uj4hfkxlv3s+bSLWARQt/W2opOOBGcdsTAamPYSReh8KWQHLHp5snnsdPBGG4YK7LnoeEDjpTOEw2MA4hcNwrpu5k5KvZGTjGBYxxryyJIScKjhCf6CAlVJEsLYr4Z9MhG2TKnsEZfOLGNCkaeZmkJGJucnfwAu+1cdz23DMIGGVC9Z2xQ+lGEejvNtu7FAg3fq0JoO2LMtO2sHV8hoUd0t7Vz00ICfafhZp3E2CCPnS3pwaZbkLbtNvY0QWNrIT5nbFY2X3GIUmsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAVV8Pd4I9xSTB35zTbsidXJEaofqdZGA8iT3Ykz/BJAi/zSzQ1FQr0FMUDOBjsRUStWbrHaE/eYtm2+7ZOp6xHuja+gFIXNIb6ABwxdZHeJMR8fVuh0thTdq9oRKC7trm3yv2znkTTAFCDmVMkI5epqiRn0R3XhdGwI50dANK9aoo3NfU+MtxuG8B9Zkh+Ij8noR/GH2WanbLcnUinDrIlLWf2Tcc7cJFrlOyhZhJ6VbNj2ottmT66mN1+lG7KhsIKwiix5mRigkwHx9cGGmLKChluG7Nhr1k5a0kYUul8m5ty7btWKI8PUow62BgaL6UWZwasVG8NCvBOzjg/teWsA==');
INSERT INTO public.component_config VALUES ('22991b02-302c-4f55-8504-b986ae98aae7', '2b459910-199f-4309-9d92-989e3b696f8a', 'priority', '100');
INSERT INTO public.component_config VALUES ('d34533b8-35aa-4ae5-8557-55131993a7e5', '27d53b1f-7f9a-4ff1-96c8-35fb3048538f', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('ea3caf40-9724-4c7f-9c37-3fd36f8e7ac0', '5244e995-a019-44bb-97c1-eb2348e2fe65', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('8e0a63f8-eab0-48a0-a437-fa87d7476dd9', '5244e995-a019-44bb-97c1-eb2348e2fe65', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('d74871d0-da65-4aeb-a1d9-751cb1f3dcbe', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('c937b1b8-6c99-415d-9179-27cbe5382091', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('b1757b62-79b8-42a4-96a9-2151ed73dc7e', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('2da8569a-b469-4890-b115-7dc1c66b9e38', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('40ade64d-06bf-4280-acc7-f9f59933b239', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('c7e3b692-d04b-4156-b686-90bfde3793ef', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('e3d940ca-e172-4f21-823b-cf45bb51e942', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('8835fd9a-8d5b-4745-aeed-e13468b86ed1', '504bb609-1016-461b-91b2-9dcad2e5f9f9', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('2a5883bd-1f8e-4346-8db0-22be416f5bc7', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('3ed407f1-87d1-4900-a01d-8f574574aba8', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('4766586c-27e7-435e-a46b-57d614c436d5', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('d6d7aa12-91ac-4561-b4c2-cbce5f4025fb', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('eec04c32-efc4-43db-80b2-38a315714a31', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('8b98fdd5-1202-4753-b09c-92e22abe310e', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('2123a845-fc46-4c4c-953c-b19a54ba5dab', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('2ca3887d-5946-4a32-91b4-59cfdbdddea9', '90eee2d9-e7a3-4538-9111-dfd72b24dade', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('ba3cb9e8-13aa-4ca7-b4e3-9650b6227f44', '0d6d6353-a086-4e75-9bdc-c37d480fcd2c', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('6583ca68-bcec-46ea-9db7-7f3f4938c80c', '4028c7c3-afd2-448c-a15b-cd70c43ede62', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('dd70d2fe-b5e5-4ee3-9168-a908f53c2e4a', '0b47b324-7316-4951-8444-728451908299', 'certificate', 'MIICozCCAYsCBgF4We+LuTANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApNVUxUSVBMRS0yMB4XDTIxMDMyMjEyMzQzNFoXDTMxMDMyMjEyMzYxNFowFTETMBEGA1UEAwwKTVVMVElQTEUtMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ937UmVmO7fCGonuHbyM043f+UWu/a/MsSEhQXaJ/5epEpSGLstTksYnV+uc+Qo3ffLEs+YUV0abGZgdCftlO3+JuERzoJy3rGlo0FMhncPBHYO/go1/geHZytdvWXg0IwJ3dGf9zXP3mv0srmcR+33G70Bi+LrEs/dLwwP0N/WNSpbMgWwfaDq9wp35JTulAIrzqxGJiSEN44MBuo67q+n4nkP+/4nHU/IjvwyJMhBJA6wt9hKHsaAPCl73jFeLnlMLFBSYI1/8P3kFLkPz6JkkSe8MV5ijko5ipo/M5BserAVoZPbs9TxoKOkwq+gK8b4djSD4UYoSwGc1lI2Ec0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAfmmdRQ37NCMqsL99BOXH9I7KqHEWLITaqPd8Pwok1gjNLmcWj2Tzb/g5hKiE99R92KnzNT+fZfe/qaACZYsUtgUApPHOXbOS7sIpkE1z/ja9RkCWlaNeAuTx29cSa0aoUW/rHfqwj7n87NFcLUOilTGQUeLqcrytX07OWneASRQ2Ln8j+SyZbTg5bCDHVNVG6JX73K+kdHelMPrJBboYTvKhCbCueE8ZyVTH7hGmiW7TO0jhvpA6iQ+whP40c0pd6pUf7rWyQAprxiwXGNRo45cF8dTGk/wz7eJu8q6jsRWKUPwFbfzi6tRBxtzmep3EzLM6gaQ+eSPPS2PQttGafg==');
INSERT INTO public.component_config VALUES ('2e30668d-adae-49dc-8d1e-596115806baf', '0b47b324-7316-4951-8444-728451908299', 'privateKey', 'MIIEowIBAAKCAQEAn3ftSZWY7t8Iaie4dvIzTjd/5Ra79r8yxISFBdon/l6kSlIYuy1OSxidX65z5Cjd98sSz5hRXRpsZmB0J+2U7f4m4RHOgnLesaWjQUyGdw8Edg7+CjX+B4dnK129ZeDQjAnd0Z/3Nc/ea/SyuZxH7fcbvQGL4usSz90vDA/Q39Y1KlsyBbB9oOr3CnfklO6UAivOrEYmJIQ3jgwG6jrur6fieQ/7/icdT8iO/DIkyEEkDrC32EoexoA8KXveMV4ueUwsUFJgjX/w/eQUuQ/PomSRJ7wxXmKOSjmKmj8zkGx6sBWhk9uz1PGgo6TCr6Arxvh2NIPhRihLAZzWUjYRzQIDAQABAoIBAFy6A4RyNIdRsTbo+d5QX3zv0LKJUarc6sxSsncAr5i9t5Jvwmm0on4QRhJJAqJ9EPTxZHLKAyW8I6Q0GdbN03e//SOKkyZPXSa3RgLGWLoKRXHQre+KDbibB2a0D1maLCoB4rXt6nWj9ZWYqAQ916WLttlkeM7uGfY8iwrcd3xvyBJUhyEMx/3Zka5dYa7AQuLFiZ39pY1Pr+F2BsYg6edPCgcq2Aj4C2g88A4hh50DquJhpTp0oIg3AlZIiutrtx05D7IpOQifhXxz1gz4Omm/Y5fJ/lxbvjup6wEKSykbYYQ1KloV7aOWeYzXAf0ouQ4cYUfm7+K8YLhjJalR6wECgYEA7xbZW8V77dlBOB6/Ykj9dtOJX+ZsF4lJ2fOaO8uH5VNUjZoGKrURBmRhewjFo14n2n1yahWu+nsNdLpySV4H0aGK+Ht53pslB5uu3kE0ouWwVklmzoKdTzFgN9TIkf9vbpWqwQINcZ0byJUmEJ21vF8p01SGrymOpRRRc7ZIXt0CgYEAqr9lnNEfB+3quRcYyZWizQhQSRN1ze9TbaM38EgOUS9x0jWqIqARMkyXvUVzSsulNJE9ZIvNuESEytZxzk2HaX4jhGw7E2n0RvLYdtGd6bwFKAmVzvHYJXByhhoZLCTlb9nh2EV9fH253RYKumz9f6uX0s+YpVmmOjkLcgDHN7ECgYA/T2ObI34fi2nzvGCdXAqSDo3P8SoqSVZe+lya/NgtZ5V6MZD0eiHZ+Xa+p6H+Eo6nEpTbdoZxGWiEwmJE/zs+zXIJPlkVEywJCbaSb93KTNwW3TT19ixFriN2ZUf/MQ6Gz+b5WNvKe/nBcY001S4shV6D8VwAwhZdrDWtWFVtmQKBgHbKoAwg5YDjwmixK/qbU19oCEs+8beraJSfeHx/9Q4AfySrV0mtqSkgZnU0y0hfM/nFjjvUk/Q+H1DrLtRD1hDLxDQOBG+2SE/QBk9r+Hwz5jZ7rLEESseJWvP3VkoDBWjy4hBQEES7R8ML4bzftOHM5Nyyt1VacK6TH2ZaKj+RAoGBAOUoD1G/KbpsJZbmBzXwmhTeCdPxChEpLkjP0yovk8oXJOBkQAZlpkjYO02/x9U8a7oQMVIpnpQJ5zyF/mm94WRffUNCuMbCpBb/toal1Q5vXnvNVV2m4kujxA4NL9tIQJC4X0s7SBbdWh1MdVLz2bqJMorbeEJQTidRz0pOwQo+');
INSERT INTO public.component_config VALUES ('d496b187-1632-458d-8db7-5527c2fc0b54', '0b47b324-7316-4951-8444-728451908299', 'priority', '100');
INSERT INTO public.component_config VALUES ('d6b75410-7cff-407a-b1b9-ff45a44ed491', '1e34c5e8-6e79-4e3f-bb53-3ab27d025512', 'priority', '100');
INSERT INTO public.component_config VALUES ('76e1f9d8-6371-40d9-bf40-6ed58bd9bd99', '1e34c5e8-6e79-4e3f-bb53-3ab27d025512', 'kid', '08b9dd04-6175-49b7-b119-cdf83bab3e94');
INSERT INTO public.component_config VALUES ('ccdc2689-f7a6-4712-827e-8b837ffde099', '1e34c5e8-6e79-4e3f-bb53-3ab27d025512', 'secret', 'yFnShTrNX3du3RxxzZSAyg');
INSERT INTO public.component_config VALUES ('e5ef485f-411f-4607-8466-99c01f3fd1ce', '537dd1b4-5b95-46d5-add4-85f0ad4f6227', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('0868ebcb-5b92-44d8-b02d-9c22c737bf1d', '537dd1b4-5b95-46d5-add4-85f0ad4f6227', 'secret', '1Q-rCxQcvIIR8YC8P29K3xsGWXJmo_QThGk6B2Dl5Y78E8ba6G-54i2nuWp7eWmIUT5wp9VCel8nye-ZxGLLfQ');
INSERT INTO public.component_config VALUES ('396675fc-6864-4571-986c-f7c98f28ce48', '537dd1b4-5b95-46d5-add4-85f0ad4f6227', 'kid', 'f7de91ab-c089-407e-8b3a-dfc37b68ed23');
INSERT INTO public.component_config VALUES ('9825e6bf-fe7b-47ac-8d51-ea9bd958b430', '537dd1b4-5b95-46d5-add4-85f0ad4f6227', 'priority', '100');
INSERT INTO public.component_config VALUES ('c7be805a-62e4-4a4d-b57a-72223ac4dddc', 'ce221818-f186-45a9-9316-9d2cfa901b5f', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('10ae427a-85d6-4975-826a-17e3aec256d8', '3ef8ac27-61cf-4dd9-ae29-fc7cb4e24888', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('4edf8d8b-2059-47c7-9c4e-ac81b38215f2', '2f191836-178f-4579-8afc-dffa7cdcc6aa', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('453586c0-a251-4f6b-bb13-1fa9391cd89d', '2f191836-178f-4579-8afc-dffa7cdcc6aa', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('35ae4482-f864-480b-9640-f39c1495f302', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('c498048e-d71b-4b6a-8abd-aaa02b99db28', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('a38fc221-bb56-4d3e-b2e5-3ce278c209e1', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('3806f3b9-bcfa-4f9c-9761-4075c882a97d', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('c9ba9327-a431-41f6-b432-6e7e52d325d0', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('8a6cdc0a-9beb-4a82-84f1-d1e4a2d40104', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('dc0a7948-4cfd-4cd6-9375-125595fc3f5d', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('da780f5f-f3a3-418e-b009-2047fa6d74a1', 'fc6b8d14-d4b9-4eff-9ec1-8c9633bab0dd', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('fa73f7b7-72f9-47de-a8d6-15121aa937a4', '570dbd36-699a-48a1-b13b-1feb4dbdb4ca', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('a40a4db2-d379-4927-a230-d20b52c17d70', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('277b4665-b6ae-4754-89b4-c5d2737dbe31', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('63c3c032-26c9-4bf4-a8a4-ff1f083e7727', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('eacb5580-9af4-4ecf-98e8-716e9171b27a', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('051125b1-4a84-4a77-855a-e47bf145b28e', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('48241cf8-e3c2-43e0-8493-3356e594ea0a', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('e066031c-7996-4011-aaad-6f589eb327e1', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('8f61dcbe-4b31-4e02-8f8e-34967a5ec812', 'a136fb74-bcc6-411f-934e-b0231c51d16d', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3c3b38e8-3c53-46fd-95b8-4959bb780914');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3bbe27b4-ade5-4e2e-bd1c-4947c4242d3b');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '6b1978ec-e73f-43ac-b308-08b5f3a53b34');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '7b887e80-1a04-4682-9014-47d7e22103ca');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'de646b5f-f17f-4a4a-8435-6cec0c866383');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '14463cae-4e86-4078-81fa-fdeee49832e7');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '485cdfd2-3bd2-4f4a-af5e-7df98ea4d724');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '944243a8-e78d-458f-a145-34962eb28607');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'c8685b63-542e-47db-8d16-28167f2e80f8');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3e171c7b-336d-4658-b680-38a76286ab72');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'de48a785-5ddc-4929-9b28-216b9f1cac23');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '7ff2bd48-a79b-438d-8922-2f2c2a055bca');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3fff8985-182e-45e8-9e7c-d17ccc194222');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'ccf5ff48-d40e-444a-b1b6-15c2e3f1c0b6');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '9647dbce-3796-4eeb-8a79-4143828058c1');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '69cdff03-5928-4c08-bc62-e58be598fa7f');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'bbd9015d-bf59-47e8-9ab1-ab3e94237e5e');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f9b5bc0d-d74e-4d18-a9d5-eef932b7e41e');
INSERT INTO public.composite_role VALUES ('de646b5f-f17f-4a4a-8435-6cec0c866383', '69cdff03-5928-4c08-bc62-e58be598fa7f');
INSERT INTO public.composite_role VALUES ('7b887e80-1a04-4682-9014-47d7e22103ca', '9647dbce-3796-4eeb-8a79-4143828058c1');
INSERT INTO public.composite_role VALUES ('7b887e80-1a04-4682-9014-47d7e22103ca', 'f9b5bc0d-d74e-4d18-a9d5-eef932b7e41e');
INSERT INTO public.composite_role VALUES ('54698925-844c-4dcc-b505-4629d5a6191e', '932c9bd6-60f7-4fb5-b1df-b3e7ac72564e');
INSERT INTO public.composite_role VALUES ('c1010175-15fc-4638-b4d0-b7731e1a1d70', '1cacb89c-9078-404e-9fea-150ce9e2278b');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'eaf59d67-d018-422c-a620-28941305b48c');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'e807d947-0370-4c31-b2aa-e91a3a45bfcb');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '6a7d8c65-9738-4838-8eee-bda685fd77e2');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '55ee154d-8283-455b-9099-cd0dbb583415');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'ea958382-586f-40f0-ac41-452b8e9a23e4');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '943f73d5-cb25-4352-886c-6c32825e0297');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3244392f-d30c-4065-a73a-52050b52213d');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '48de4e37-b665-45d3-9997-3eda14dc3445');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'fff17ea2-3aa1-4ceb-8369-85a50d5e7dbc');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f8c1262f-6304-4388-8b54-eaab73d10527');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '2f8e7765-ecb8-4c78-9687-ba686d7d4c58');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '923c3f6e-01df-44a4-b3f8-b00ea54387a8');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8a0a1839-eef4-485c-a5d9-9a01152aae43');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3dd99274-7aab-4236-a7ee-3f4cadad9255');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f4491380-4354-408e-b82f-ae6171ae4371');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '07428b67-d37a-445d-995e-1060cfbb47fd');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'adac02d0-dd73-4745-adba-6ca81828f083');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'c0ff1007-c77e-4bb9-b308-420f4bc06bb8');
INSERT INTO public.composite_role VALUES ('ea958382-586f-40f0-ac41-452b8e9a23e4', '07428b67-d37a-445d-995e-1060cfbb47fd');
INSERT INTO public.composite_role VALUES ('55ee154d-8283-455b-9099-cd0dbb583415', 'c0ff1007-c77e-4bb9-b308-420f4bc06bb8');
INSERT INTO public.composite_role VALUES ('55ee154d-8283-455b-9099-cd0dbb583415', 'f4491380-4354-408e-b82f-ae6171ae4371');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '4cf11e6a-a6e7-4559-b48b-c3c36431e8c7');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '7b4db5dd-8db2-4ede-a733-6c291ca0319f');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '7561a983-179c-402f-b31b-3820e397dd95');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '4b870f05-0756-4a3e-951d-c376af149736');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'ce5a1145-1673-4a9f-a729-f3302dd6741e');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '3e110730-1e38-41ea-b832-6cca78450cd3');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '486d6154-f425-411e-aff3-20488be28ad1');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'ad5a2ffc-5703-45e1-8fd1-d4b336a0ebc5');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '62c70a28-b643-4065-885a-0e7b3e2d1757');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'db458ef8-742c-451d-a165-f865e8b1fcce');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'c1e1fd8d-ba46-4b8b-b199-ab6ada3d2a33');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '3f0a0159-5122-4f34-b8e3-7c173ab486af');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'c5a29f48-b279-4079-9b14-6b4cd46e8a49');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '3846ac81-e0d9-43de-ac0d-f5071a7d2556');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'c1937608-5393-4c89-8eaf-6cb16a77dfae');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', 'f96cfc10-e25e-4603-937a-2649d8d20302');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '2ce1b294-6a9e-43b9-8bbe-b2969ac060cf');
INSERT INTO public.composite_role VALUES ('4b870f05-0756-4a3e-951d-c376af149736', 'c1937608-5393-4c89-8eaf-6cb16a77dfae');
INSERT INTO public.composite_role VALUES ('7561a983-179c-402f-b31b-3820e397dd95', '3846ac81-e0d9-43de-ac0d-f5071a7d2556');
INSERT INTO public.composite_role VALUES ('7561a983-179c-402f-b31b-3820e397dd95', '2ce1b294-6a9e-43b9-8bbe-b2969ac060cf');
INSERT INTO public.composite_role VALUES ('1d74ae8d-2aa0-4118-a1bb-ae42f563923a', '5c82227a-676d-48d3-b3b2-4a15f54d4b75');
INSERT INTO public.composite_role VALUES ('d00a864d-3ab5-48ae-8005-d34165200eb1', 'b046b50a-4f2c-406e-86b9-47a865a0249f');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f9eb2877-0c22-403a-8ff2-77607e708735');
INSERT INTO public.composite_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '714491b2-a771-4da1-aea7-5c4d1beda251');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'cfdc0fc9-d966-4f14-bca3-27d2bf6d1a54');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '7fc6b75e-e6d2-4799-a137-1cf6fccf19ad');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '0872818f-05b3-437a-94f4-cd4cf36d956e');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '1cde913d-7dae-4d36-bd75-986cbf4a9e9a');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'e6b7a996-f270-4ec7-88f0-bee8179a6530');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '7d696583-3876-4801-ab6f-65243881c50d');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8898c677-4fa7-4972-a70b-6a9e5a2fdf0f');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f2a57dac-56d7-4d20-98b4-bacc3f535c4a');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '0eb26353-d75d-4606-947c-990288909a06');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8ac7f535-482a-4cd0-8a68-9e95e4302482');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'fc57f626-0c97-485f-a353-66e48e9168ce');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'dc8747d4-86be-4a0d-b428-bfb57d2ac2a9');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'b8a8a7b3-60aa-4dad-bd13-df95cc5f70b5');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'e9383527-8320-4999-8d2e-9bdb33d7dc7f');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'c5bf428e-2dde-4c80-a83a-e72ad72fafff');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'ff1459ff-414c-46e4-bdad-2161f1e6f55f');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '24e14748-aea7-4908-8b54-cd8a1c0ba6be');
INSERT INTO public.composite_role VALUES ('1cde913d-7dae-4d36-bd75-986cbf4a9e9a', 'c5bf428e-2dde-4c80-a83a-e72ad72fafff');
INSERT INTO public.composite_role VALUES ('0872818f-05b3-437a-94f4-cd4cf36d956e', 'e9383527-8320-4999-8d2e-9bdb33d7dc7f');
INSERT INTO public.composite_role VALUES ('0872818f-05b3-437a-94f4-cd4cf36d956e', '24e14748-aea7-4908-8b54-cd8a1c0ba6be');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '14190a50-329c-4f33-8275-f195fedcf3ee');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'a2a45d63-cee7-43b4-b6d5-f7067aad1640');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'e44b29cb-70ba-498a-88a3-7b98b0ade8cd');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'b8eac30b-7982-4cd9-84a4-1c6570f86503');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'ac0e9411-b67b-4b14-a8d9-09fdb5830dde');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '69468a9f-f8ee-4de6-b7aa-ba0afcaf1a02');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'f17bfa5d-240f-4546-8b22-b2cab66971c5');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '29941611-a198-44aa-81c7-3eadbc278cea');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '3624d92a-a77e-45ab-9803-ea5ea9922b4b');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'a863f12a-ae2d-484f-98cb-08ffa84a497e');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '2709f748-0bb2-4f21-bd20-55f23a03d8c6');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '3be225df-e13c-45f4-b266-f584f17b7a27');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '82795ac2-889a-444a-a316-2b9fb605bea0');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '6f7fb2a4-ce29-45e6-ba1c-cd2b85fb4397');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '18e81483-9069-48bc-9617-cc192d83cdfd');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '8144e680-6f56-40f1-9445-565dccc7bc25');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '7a8f16f1-7151-4882-8263-bc67ec1e17c7');
INSERT INTO public.composite_role VALUES ('b8eac30b-7982-4cd9-84a4-1c6570f86503', '18e81483-9069-48bc-9617-cc192d83cdfd');
INSERT INTO public.composite_role VALUES ('e44b29cb-70ba-498a-88a3-7b98b0ade8cd', '7a8f16f1-7151-4882-8263-bc67ec1e17c7');
INSERT INTO public.composite_role VALUES ('e44b29cb-70ba-498a-88a3-7b98b0ade8cd', '6f7fb2a4-ce29-45e6-ba1c-cd2b85fb4397');
INSERT INTO public.composite_role VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', 'd8e1834a-363c-4fc1-ab1e-c3d6a6235d81');
INSERT INTO public.composite_role VALUES ('34658f24-2368-43e6-8d3b-3d46e981bc66', '59087fe4-77ae-41d8-a0da-e6102f01a05e');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'c24174d0-1ae2-4f4c-b3c8-ea490c9638d5');
INSERT INTO public.composite_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '43e8dc52-5a19-43a4-9587-3ec511b0e43e');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'a2031174-f933-4be6-8624-e51e2ccdabc9');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8adbfafc-383d-495d-b520-32d7f2671eb4');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f4f23bd2-8cc4-42a6-ac26-8d7db35a9ee0');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '2b9bf73a-0ba9-4143-98c9-5dbdeed04d21');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'af3882b0-f747-4828-a696-3e252f203180');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'f2dab8ba-587b-42a2-9c75-e954fa69c355');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '50dd6260-225d-4eb3-acaa-9d52f2922d13');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'e5974b90-4e34-40e4-8244-feefc3fc19c4');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '791646d2-ca8f-4157-89aa-7762de3764e8');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8338b462-e17d-4bcb-ac8c-23a729628b43');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '4bdacf85-7225-472c-acf0-d9c30a44d673');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '75d88ca0-93a4-417b-9b4d-03568e54c465');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '76925f9b-c578-49a8-a1ac-dd9192931c58');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '5e6dd88f-8a9d-42d7-b322-8b9abb33f9ae');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '3013967b-a8d3-469d-8663-043fb41a10fc');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '95af4cd8-024c-4eff-9f1d-a7bc15a3616e');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '0e30b20a-aab2-4ad1-a2b6-c2de9f2a7e8a');
INSERT INTO public.composite_role VALUES ('2b9bf73a-0ba9-4143-98c9-5dbdeed04d21', '3013967b-a8d3-469d-8663-043fb41a10fc');
INSERT INTO public.composite_role VALUES ('f4f23bd2-8cc4-42a6-ac26-8d7db35a9ee0', '5e6dd88f-8a9d-42d7-b322-8b9abb33f9ae');
INSERT INTO public.composite_role VALUES ('f4f23bd2-8cc4-42a6-ac26-8d7db35a9ee0', '0e30b20a-aab2-4ad1-a2b6-c2de9f2a7e8a');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '1db804bc-007b-493b-9ed8-091d047ecc39');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '5d54c5c4-17ff-490f-b5d7-f6febbc78a5a');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '78e59214-5829-4b85-9bc2-805497bbbd33');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '80cc50b7-96c5-4cdf-b827-7bbf48ddb77e');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '66314e5e-72e1-45f1-a167-3c6588827daa');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '3c09e741-69d0-460d-81ac-b2bf7a7f7048');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '22700f2c-b9d6-437e-a11a-bedf74921377');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '71613923-f03c-4ad6-9ec2-041af63ae8f5');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '3cc090f4-b164-4ab6-acbe-5b729a3dc48c');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', 'c2f675e3-f3af-4c0d-9c82-1d111b03be1e');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', 'cd9dd234-bcfe-4416-98ea-c3a7183f838f');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '43501532-c622-4703-a660-f765c93c6ebd');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '796408c9-759e-4371-981c-b5546a42d22b');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '42c1fde8-8f55-475a-a19c-51be3bef41ab');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '0fe82f29-7ac0-400e-a4c8-93e21269bfa6');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '90783c0f-f077-40ea-a32c-761084c8cc0b');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', '1a66e556-e883-4bc0-9f0a-586997d42fdd');
INSERT INTO public.composite_role VALUES ('80cc50b7-96c5-4cdf-b827-7bbf48ddb77e', '0fe82f29-7ac0-400e-a4c8-93e21269bfa6');
INSERT INTO public.composite_role VALUES ('78e59214-5829-4b85-9bc2-805497bbbd33', '42c1fde8-8f55-475a-a19c-51be3bef41ab');
INSERT INTO public.composite_role VALUES ('78e59214-5829-4b85-9bc2-805497bbbd33', '1a66e556-e883-4bc0-9f0a-586997d42fdd');
INSERT INTO public.composite_role VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', '1ea4390e-966e-491a-a007-844011b565f4');
INSERT INTO public.composite_role VALUES ('289f87e7-b038-4142-b988-9a62aad064b6', '5570bf22-05ca-48ba-872a-1c8523606d06');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '5d1e4e22-1e49-4f23-937e-265f546d7783');
INSERT INTO public.composite_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', 'ed16fed3-2c5f-4c43-b1a5-06300a0b7f3a');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'fa099487-c89d-439a-bc1d-b1df480a95cc');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'ee8da547-2fc7-4853-99a8-02f44819a345');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'fb972670-20d5-482c-aad7-d987d0a0de13');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '304bb27a-cd5c-4569-9ce5-7d0e3c520e9d');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '4f654d1f-9fc1-4bd9-a776-a57888f31fed');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '1d753867-e34d-47e1-ad35-bedb780b5c58');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '596cf08d-80a3-4cbc-b9c6-c21b841543b0');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '39229924-3555-4251-beb8-d3e1ab274cca');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'cde58882-311e-4e4e-97ec-9c51e30f6753');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'd50cb9cb-a79c-41db-902d-bb17cd1e3147');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '64a5ade4-12a5-47c3-96ba-3cde04fe18df');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '14724bf0-5568-4001-8dcb-dbae4f0a4e30');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '5cfb07a2-928b-4349-b42b-b0f2c38287e5');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '8ab32ff3-91ff-469a-8833-3d92306657e3');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'bca10549-4131-4e5c-b0bb-5b0afc8b7389');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '48e7e14e-efb6-4362-9833-341e7edb40fd');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '9fa231f6-69e5-4174-bd35-4a4ff566d6b8');
INSERT INTO public.composite_role VALUES ('304bb27a-cd5c-4569-9ce5-7d0e3c520e9d', 'bca10549-4131-4e5c-b0bb-5b0afc8b7389');
INSERT INTO public.composite_role VALUES ('fb972670-20d5-482c-aad7-d987d0a0de13', '8ab32ff3-91ff-469a-8833-3d92306657e3');
INSERT INTO public.composite_role VALUES ('fb972670-20d5-482c-aad7-d987d0a0de13', '9fa231f6-69e5-4174-bd35-4a4ff566d6b8');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'dd2f03f3-ad0a-41aa-8215-a071c45ac7c2');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '1a03b856-0e0e-44c7-85cc-81570003c46a');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'e887c80c-d53e-41e7-a61f-16bc7d987cc8');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '61a090bd-d90c-4956-841b-c67b4f91efa9');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'dcbe46df-bf32-4dae-9a1b-6aa0530e5a77');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '7686c11f-874f-4458-bca3-826008f9e6e7');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '74437dbd-d5d6-4989-a9f5-46b581a184a3');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '9fbebf96-a65b-4494-9818-892d6c40ab45');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '0108c7d9-4252-4c37-8926-3fdf9b1c4ee6');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'a0c349b8-c843-471b-984a-fcab1b01b40b');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '3191c199-f1d9-4910-af3b-cc170c4b9d48');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '433370c9-7279-43fb-bba2-3626b49c4b3a');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '5d64f8f8-2c7a-4b1f-a674-0a1693aea3df');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'eff0d7bf-7968-4681-87da-d967f57304a6');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'f2230d88-b1be-48c8-b620-4b4e4f6ef88f');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '78c4152e-eefb-4ae6-9498-3ffe6591465a');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'b332b59d-d40a-4e37-82e8-a91fdeef4fe1');
INSERT INTO public.composite_role VALUES ('61a090bd-d90c-4956-841b-c67b4f91efa9', 'f2230d88-b1be-48c8-b620-4b4e4f6ef88f');
INSERT INTO public.composite_role VALUES ('e887c80c-d53e-41e7-a61f-16bc7d987cc8', 'b332b59d-d40a-4e37-82e8-a91fdeef4fe1');
INSERT INTO public.composite_role VALUES ('e887c80c-d53e-41e7-a61f-16bc7d987cc8', 'eff0d7bf-7968-4681-87da-d967f57304a6');
INSERT INTO public.composite_role VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', 'cf8fc210-ca50-4c0e-9fe4-48625a138cd3');
INSERT INTO public.composite_role VALUES ('37da71b5-a508-4453-81f5-c76c7359978d', '7341fd60-8879-4cdb-ae2f-a20dacf3bc92');
INSERT INTO public.composite_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '575897d2-14a8-4a93-915a-4b63712fa12e');
INSERT INTO public.composite_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', '028a6355-28b0-4983-83e1-f76ef4f33b3b');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.credential VALUES ('1a0562b5-e229-4a3f-95ca-a68bda1c2add', NULL, 'password', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a', 1615297789602, NULL, '{"value":"+R7RUVpBqcElNb1qx5yQoFPaUVdgdotSL15lf4YlD0Ga2G/VqUUiosTwn8o7JL0bmI6M0aoQqoHUY/6v1NIvxA==","salt":"HDIo5m+gJoad+WtwgVMf3Q==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('b08457b7-0bda-4a57-9208-8c77d22a21cd', NULL, 'password', '146c0cdb-130e-4dc2-b158-05bf2f6161cb', 1615306345034, NULL, '{"value":"gaRbUPf2pRQazG6ni0pYXb2X0MUvevUO3zqeB8RPBsD2CYepmqHplh35HM/H94thxN+Ubg9cTQ4RXaHhhD2WmQ==","salt":"IDVViMHZwDIHLAyEaZE+dQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('3c578761-29e3-407f-b857-7227f79935a9', NULL, 'password', '3fd205f6-d93b-4c04-9760-90a7ccd517ea', 1615307030952, NULL, '{"value":"nal7dImxhG44S0oHSIVOaeIl7NPXlIpBgbvZUJh7CpfV2i0krBjEX/AbhqMWOhaY96zvU+IVJYEEXHpC5YQ8Ww==","salt":"nPq9mkrnKNLB87ijzy/ysA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('c4a12a52-084c-40a7-8a94-6481d8b67f0e', NULL, 'password', '0b491d91-a740-4c51-9ce7-6f51dd5a277c', 1615309538042, NULL, '{"value":"iTv+JzVPNvM6b5fDRro45ghjbvNvGWr/nCL9GAVNlPgDRgEIyMLkcnAQE8mUWecJfxTh52pZCa9M0y8gS4Z1sQ==","salt":"cjyubiPVZiaFXtLwmeUJUA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('1146c40e-7630-4074-964d-f58967b54a40', NULL, 'password', 'b3fb07c4-5b20-40d0-a741-0a8974ab2247', 1616415950117, NULL, '{"value":"AEBonf82lsCaVeIukd73pPFb58QHIgWXtdl9+hNBpwdCWfQbWLZRQVrBDK7MklySrcggUhLU40sWqW1/lBIAgw==","salt":"nZzO3x52Kc6frFJujtcD7A==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('33d6e159-329c-49f9-a7eb-330dbde2d858', NULL, 'password', '7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8', 1616415993430, NULL, '{"value":"4w3LV5lViyGqyqfSDgYZoUoSUJw7yvWbA8X+a0959U8UcMhYYwEnmfU0sYwPYSxgMQtp762Hzh92E1HIQM5j4Q==","salt":"jydZ8yrO/Ak+PvT5JQUELQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('e157e16e-3bf9-49ad-a7d6-4b7155f74e65', NULL, 'password', '2aea0f0c-cca1-442e-8d9b-3953b1412340', 1616416044822, NULL, '{"value":"K4gEWqmJOd6jtjaGKuwP4n0LA300zHr32xJS3j9YSyvmo8i5+lfwfzEGEacPq11YJY2yTKnlnYrg1lAkx6GP1w==","salt":"TAVsvlj4IOuzeSdodEZV6w==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('b8bbb3db-e31e-4983-b6e6-599bbb5695ca', NULL, 'password', '77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b', 1616416503620, NULL, '{"value":"1lWy9PQ6KrLlnCv9ofxNpzTFHAAvtvk5Vbr2OeFRqdvSfAFZg/bPrPlEItnvzLMT53cMVVTDZdXcxswBfDAUHw==","salt":"n1KSzkUOofpHkpp3Ah/KtA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('84b17cb3-af5e-41a6-b1a4-863562d84239', NULL, 'password', '8b345759-96d0-460c-bc76-b40629bb321e', 1616416528656, NULL, '{"value":"h9aeeGVLMm057E6Avew/kPP94zC57vexfNkfSC/wawJu6gPiJQjXNMu7ZOjmplfxhyjta+ks6Fb2QATHPlhoDA==","salt":"REaFR+qeFyOIadPaCXNKFg==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('2ae5bad4-5b01-4d68-8ce3-5ffea9556ea2', NULL, 'password', '2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c', 1616416559629, NULL, '{"value":"tCgge/xwTLLlIMvgJ+kpQQc9RdNkE4EFqev0KhLaUOVGWZfsziUecayQmkc7pMsDcoo8sfuYKRfmx0TFqIgKbA==","salt":"sWTA9t8VlOgBkys+q5XTQQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('ed9acfea-f36e-4785-bc71-f7c2c290253d', NULL, 'password', '0a1087ac-e533-4bca-aecf-e701c8c74ef5', 1616416630365, NULL, '{"value":"vxBRnwgwFVnf34NSo1ISYgm1qsdqBXL7jm3M3LNe84YZKwSAVeBGTzYbwCINcfFP5nv258EdmutgCn3MiCsZBg==","salt":"8m01T2u+l/BYhKCHyabivw==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('c3be5646-aafb-463c-b0f6-d5d2b09383cb', NULL, 'password', 'b201ddad-9c54-49c1-b3da-148e88789b5b', 1616416653625, NULL, '{"value":"HkmZoT60QdCwgwLJ2BDMzCAlo8nfLC4u1g2h4AJTkqjNh4jFKdQW5tIC9r7K7yp607pgXgNLtgwbzPdX/5bQkg==","salt":"yO9PjLA0Kb0m36uthjAz4w==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('bfd09724-ddbf-418c-8ed5-03dae037aa39', NULL, 'password', 'f1b286f3-f987-4238-84bd-63bbf41b33e7', 1616416686840, NULL, '{"value":"lXDgdnHyi1iy74rB8jtavzzeNA5NwSEkLqRKh/1rX4jOH00dj34p2fRz+mUbiLal1gxx8TkQp7j1VqDf2k6dNA==","salt":"SoK16/xjEICaYB+OxNV0aA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-03-09 13:45:31.535606', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-03-09 13:45:31.564234', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-03-09 13:45:31.631672', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-03-09 13:45:31.640245', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-03-09 13:45:31.805987', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-03-09 13:45:31.817514', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-03-09 13:45:32.032234', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-03-09 13:45:32.043255', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-03-09 13:45:32.055709', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-03-09 13:45:32.259182', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-03-09 13:45:32.374903', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-03-09 13:45:32.38513', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-03-09 13:45:32.446891', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-03-09 13:45:32.498354', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-03-09 13:45:32.50246', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-03-09 13:45:32.507039', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-03-09 13:45:32.510624', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-03-09 13:45:32.578249', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-03-09 13:45:32.645525', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-03-09 13:45:32.654534', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-03-09 13:45:33.496729', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-03-09 13:45:32.659328', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-03-09 13:45:32.66451', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-03-09 13:45:32.694776', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-03-09 13:45:32.703824', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-03-09 13:45:32.70709', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-03-09 13:45:32.76394', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-03-09 13:45:32.879212', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-03-09 13:45:32.884514', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-03-09 13:45:32.986814', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-03-09 13:45:33.007592', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-03-09 13:45:33.032319', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-03-09 13:45:33.039394', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-03-09 13:45:33.048187', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-03-09 13:45:33.051852', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-03-09 13:45:33.092529', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-03-09 13:45:33.100788', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-03-09 13:45:33.112457', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-03-09 13:45:33.118986', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-03-09 13:45:33.125257', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-03-09 13:45:33.128559', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-03-09 13:45:33.140924', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-03-09 13:45:33.153906', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-03-09 13:45:33.472825', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-03-09 13:45:33.484488', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-03-09 13:45:33.509432', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-03-09 13:45:33.514551', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-03-09 13:45:33.606077', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-03-09 13:45:33.617458', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-03-09 13:45:33.720841', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-03-09 13:45:33.801412', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-03-09 13:45:33.810298', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-03-09 13:45:33.81688', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-03-09 13:45:33.823382', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-03-09 13:45:33.83784', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-03-09 13:45:33.85102', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-03-09 13:45:33.898745', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-03-09 13:45:34.140996', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-03-09 13:45:34.209198', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-03-09 13:45:34.223604', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-03-09 13:45:34.248422', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-03-09 13:45:34.263747', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-03-09 13:45:34.272274', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-03-09 13:45:34.278972', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-03-09 13:45:34.287197', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-03-09 13:45:34.320665', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-03-09 13:45:34.334934', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-03-09 13:45:34.347', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-03-09 13:45:34.371409', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-03-09 13:45:34.385194', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-03-09 13:45:34.39512', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-03-09 13:45:34.410843', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-03-09 13:45:34.425218', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-03-09 13:45:34.430988', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-03-09 13:45:34.479027', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-03-09 13:45:34.496162', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-03-09 13:45:34.505283', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-03-09 13:45:34.510256', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-03-09 13:45:34.554545', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-03-09 13:45:34.560504', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-03-09 13:45:34.574657', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-03-09 13:45:34.580091', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-03-09 13:45:34.589472', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-03-09 13:45:34.594261', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-03-09 13:45:34.605335', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-03-09 13:45:34.614155', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-03-09 13:45:34.626162', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '5297531068');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-03-09 13:45:34.642812', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '5297531068');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.default_client_scope VALUES ('master', '69c8a637-b515-497c-b520-75f13b2a7921', false);
INSERT INTO public.default_client_scope VALUES ('master', '3b477f97-3980-4292-838a-06b6f5c1cd1c', true);
INSERT INTO public.default_client_scope VALUES ('master', '899db04f-fec1-4927-a1fc-1858db3fb9b1', true);
INSERT INTO public.default_client_scope VALUES ('master', '550681ed-8385-40d7-ab96-e9362d9ea5d8', true);
INSERT INTO public.default_client_scope VALUES ('master', '999de5ea-c246-48b7-ac19-39656c5cbe65', false);
INSERT INTO public.default_client_scope VALUES ('master', '5f53e875-380b-4a5f-8868-35d3bf3fa68c', false);
INSERT INTO public.default_client_scope VALUES ('master', '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7', true);
INSERT INTO public.default_client_scope VALUES ('master', 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232', true);
INSERT INTO public.default_client_scope VALUES ('master', 'fd6de16c-7842-4017-be9a-71deec913efa', false);
INSERT INTO public.default_client_scope VALUES ('FRONT', '22707625-d41e-497c-bace-e7a813aaa540', false);
INSERT INTO public.default_client_scope VALUES ('FRONT', '4405da81-2a2b-4635-b640-c6602e149249', true);
INSERT INTO public.default_client_scope VALUES ('FRONT', 'f0690f74-6443-4e88-b325-b1685b29e13b', true);
INSERT INTO public.default_client_scope VALUES ('FRONT', '83b17e4e-ece2-4f51-9e61-1a1eca679481', true);
INSERT INTO public.default_client_scope VALUES ('FRONT', 'd52b9d2d-fcbf-4971-a130-8f247c796b49', false);
INSERT INTO public.default_client_scope VALUES ('FRONT', '2f381d78-5b8d-4141-ac75-ed1a79d8d32b', false);
INSERT INTO public.default_client_scope VALUES ('FRONT', '334c9858-805b-4009-b2ee-f41675423704', true);
INSERT INTO public.default_client_scope VALUES ('FRONT', 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0', true);
INSERT INTO public.default_client_scope VALUES ('FRONT', 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1', false);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', 'f58a4944-62f0-4f47-825d-9476cd4433e8', false);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '3699b254-0664-4b07-9e7a-d968bdad3df8', true);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '3081cb26-994c-4e00-ae3e-a82637769dd0', true);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '7671b352-cec6-4316-b98a-437d4c9beb50', true);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', 'dd571a9c-e5f6-419b-bb83-3de8000c65f8', false);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84', false);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '9aa56e87-5d61-4c77-b350-22f7bd22dc77', true);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', '75fd9f90-1839-4625-8edc-1583f9d237c7', true);
INSERT INTO public.default_client_scope VALUES ('PRIVATE', 'e036bf2e-0de5-4061-b86b-78a9ac863f82', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', '43ac3c4f-fe7e-4536-b93a-0dc38521c8ae', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', 'ffb8a4b5-4a88-47db-ba96-466cabb4782d', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', '1f83de5f-37aa-49d9-81fb-409e19ec3376', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', '8fbf8034-afbf-4040-9ec5-ec032802d961', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', 'f4697e9b-4da9-43aa-ad21-6b9e10113314', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', '3c13a0ee-606c-44e4-86b2-b73a965d3299', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', 'b2ace36e-f791-4587-a1e5-466e6df5fb35', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', '6e375a5a-2cc1-456f-9323-7ead1e0d485f', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-1', 'c5df37e4-6b8d-45a8-b005-327efe82b248', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '032504f4-ea20-445c-a3e1-4d951148847e', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '6dab14c3-5ac0-4377-99e3-eaefadf7d47c', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '3473998a-007f-450e-82c7-cc0bcf5e47b0', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '56d220d0-0834-442f-a089-982de60c31a3', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '090910ec-4835-4119-8494-cf35d3d421b4', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '6f603f25-df06-48a1-b072-5d9f813f1d28', false);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', 'd7b29718-8706-48c4-a971-080ad4a9d566', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', 'b23103d8-b4e5-4997-b762-5e26299b62dd', true);
INSERT INTO public.default_client_scope VALUES ('MULTIPLE-2', '5201565d-e810-4525-bd7e-cfab2a376e1f', false);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.keycloak_role VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', 'master', false, '${role_admin}', 'admin', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('3c3b38e8-3c53-46fd-95b8-4959bb780914', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('3bbe27b4-ade5-4e2e-bd1c-4947c4242d3b', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_create-client}', 'create-client', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('6b1978ec-e73f-43ac-b308-08b5f3a53b34', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-realm}', 'view-realm', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('7b887e80-1a04-4682-9014-47d7e22103ca', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-users}', 'view-users', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('de646b5f-f17f-4a4a-8435-6cec0c866383', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-clients}', 'view-clients', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('14463cae-4e86-4078-81fa-fdeee49832e7', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-events}', 'view-events', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('485cdfd2-3bd2-4f4a-af5e-7df98ea4d724', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('944243a8-e78d-458f-a145-34962eb28607', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_view-authorization}', 'view-authorization', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('c8685b63-542e-47db-8d16-28167f2e80f8', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-realm}', 'manage-realm', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('3e171c7b-336d-4658-b680-38a76286ab72', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-users}', 'manage-users', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('de48a785-5ddc-4929-9b28-216b9f1cac23', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-clients}', 'manage-clients', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('7ff2bd48-a79b-438d-8922-2f2c2a055bca', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-events}', 'manage-events', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('3fff8985-182e-45e8-9e7c-d17ccc194222', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('ccf5ff48-d40e-444a-b1b6-15c2e3f1c0b6', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_manage-authorization}', 'manage-authorization', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('9647dbce-3796-4eeb-8a79-4143828058c1', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_query-users}', 'query-users', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('69cdff03-5928-4c08-bc62-e58be598fa7f', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_query-clients}', 'query-clients', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('bbd9015d-bf59-47e8-9ab1-ab3e94237e5e', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_query-realms}', 'query-realms', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('f9b5bc0d-d74e-4d18-a9d5-eef932b7e41e', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_query-groups}', 'query-groups', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('3f5fbaf9-67f4-4d47-99d7-292ed84bab31', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_view-profile}', 'view-profile', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('54698925-844c-4dcc-b505-4629d5a6191e', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_manage-account}', 'manage-account', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('932c9bd6-60f7-4fb5-b1df-b3e7ac72564e', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_manage-account-links}', 'manage-account-links', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('1df41a91-57b1-4472-a7c3-27cc58c381f2', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_view-applications}', 'view-applications', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('1cacb89c-9078-404e-9fea-150ce9e2278b', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_view-consent}', 'view-consent', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('c1010175-15fc-4638-b4d0-b7731e1a1d70', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_manage-consent}', 'manage-consent', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('f2cdbebb-6eea-43b1-ae70-baea2fc2629f', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', true, '${role_delete-account}', 'delete-account', 'master', 'db11acde-c6f6-4d2e-8f32-8e006466f05d', NULL);
INSERT INTO public.keycloak_role VALUES ('866e846c-e76e-4101-8895-59d7cbf40a44', 'd0d12bd8-0628-453b-8827-280cb9c1bd5b', true, '${role_read-token}', 'read-token', 'master', 'd0d12bd8-0628-453b-8827-280cb9c1bd5b', NULL);
INSERT INTO public.keycloak_role VALUES ('eaf59d67-d018-422c-a620-28941305b48c', '1479f416-834e-40dd-b0cd-1417612491bf', true, '${role_impersonation}', 'impersonation', 'master', '1479f416-834e-40dd-b0cd-1417612491bf', NULL);
INSERT INTO public.keycloak_role VALUES ('cc936d10-11d6-4455-a701-5e91bbccf24d', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('d27a49d3-fba8-49d9-8855-f3305a06d00b', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('e807d947-0370-4c31-b2aa-e91a3a45bfcb', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_create-client}', 'create-client', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('6a7d8c65-9738-4838-8eee-bda685fd77e2', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-realm}', 'view-realm', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('55ee154d-8283-455b-9099-cd0dbb583415', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-users}', 'view-users', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('ea958382-586f-40f0-ac41-452b8e9a23e4', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-clients}', 'view-clients', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('943f73d5-cb25-4352-886c-6c32825e0297', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-events}', 'view-events', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('3244392f-d30c-4065-a73a-52050b52213d', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('48de4e37-b665-45d3-9997-3eda14dc3445', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_view-authorization}', 'view-authorization', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('fff17ea2-3aa1-4ceb-8369-85a50d5e7dbc', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-realm}', 'manage-realm', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('f8c1262f-6304-4388-8b54-eaab73d10527', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-users}', 'manage-users', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('2f8e7765-ecb8-4c78-9687-ba686d7d4c58', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-clients}', 'manage-clients', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('923c3f6e-01df-44a4-b3f8-b00ea54387a8', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-events}', 'manage-events', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('8a0a1839-eef4-485c-a5d9-9a01152aae43', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('3dd99274-7aab-4236-a7ee-3f4cadad9255', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('f4491380-4354-408e-b82f-ae6171ae4371', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_query-users}', 'query-users', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('07428b67-d37a-445d-995e-1060cfbb47fd', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_query-clients}', 'query-clients', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('adac02d0-dd73-4745-adba-6ca81828f083', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_query-realms}', 'query-realms', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('c0ff1007-c77e-4bb9-b308-420f4bc06bb8', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_query-groups}', 'query-groups', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('ceb08e3a-6372-4cd1-bbfa-6d9c5f532e7d', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_realm-admin}', 'realm-admin', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('4cf11e6a-a6e7-4559-b48b-c3c36431e8c7', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_create-client}', 'create-client', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('7b4db5dd-8db2-4ede-a733-6c291ca0319f', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-realm}', 'view-realm', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('7561a983-179c-402f-b31b-3820e397dd95', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-users}', 'view-users', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('4b870f05-0756-4a3e-951d-c376af149736', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-clients}', 'view-clients', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('ce5a1145-1673-4a9f-a729-f3302dd6741e', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-events}', 'view-events', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('3e110730-1e38-41ea-b832-6cca78450cd3', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-identity-providers}', 'view-identity-providers', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('486d6154-f425-411e-aff3-20488be28ad1', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_view-authorization}', 'view-authorization', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('ad5a2ffc-5703-45e1-8fd1-d4b336a0ebc5', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-realm}', 'manage-realm', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('62c70a28-b643-4065-885a-0e7b3e2d1757', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-users}', 'manage-users', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('db458ef8-742c-451d-a165-f865e8b1fcce', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-clients}', 'manage-clients', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('c1e1fd8d-ba46-4b8b-b199-ab6ada3d2a33', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-events}', 'manage-events', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('3f0a0159-5122-4f34-b8e3-7c173ab486af', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('c5a29f48-b279-4079-9b14-6b4cd46e8a49', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_manage-authorization}', 'manage-authorization', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('3846ac81-e0d9-43de-ac0d-f5071a7d2556', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_query-users}', 'query-users', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('c1937608-5393-4c89-8eaf-6cb16a77dfae', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_query-clients}', 'query-clients', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('f96cfc10-e25e-4603-937a-2649d8d20302', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_query-realms}', 'query-realms', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('2ce1b294-6a9e-43b9-8bbe-b2969ac060cf', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_query-groups}', 'query-groups', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('d4c9d85b-026f-4f0c-b9ea-26219fe7bd4e', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_view-profile}', 'view-profile', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('1d74ae8d-2aa0-4118-a1bb-ae42f563923a', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_manage-account}', 'manage-account', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('5c82227a-676d-48d3-b3b2-4a15f54d4b75', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_manage-account-links}', 'manage-account-links', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('8f71b1af-9dae-43c7-ac55-a5632df28596', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_view-applications}', 'view-applications', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('b046b50a-4f2c-406e-86b9-47a865a0249f', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_view-consent}', 'view-consent', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('d00a864d-3ab5-48ae-8005-d34165200eb1', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_manage-consent}', 'manage-consent', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('784fb651-ed90-4d9f-b806-550a57b1cca2', '0e37e996-c751-4130-8b1b-d5b4c112ee20', true, '${role_delete-account}', 'delete-account', 'FRONT', '0e37e996-c751-4130-8b1b-d5b4c112ee20', NULL);
INSERT INTO public.keycloak_role VALUES ('f9eb2877-0c22-403a-8ff2-77607e708735', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', true, '${role_impersonation}', 'impersonation', 'master', 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', NULL);
INSERT INTO public.keycloak_role VALUES ('714491b2-a771-4da1-aea7-5c4d1beda251', '13d781d1-3cd5-4139-ab26-239c43ae3d30', true, '${role_impersonation}', 'impersonation', 'FRONT', '13d781d1-3cd5-4139-ab26-239c43ae3d30', NULL);
INSERT INTO public.keycloak_role VALUES ('7a73a4ce-4282-4312-a35d-43e61bce3eba', 'b1a078e9-978e-4dd2-810d-3566a425c04a', true, '${role_read-token}', 'read-token', 'FRONT', 'b1a078e9-978e-4dd2-810d-3566a425c04a', NULL);
INSERT INTO public.keycloak_role VALUES ('9c020280-88eb-46f1-81a6-431ee2962be6', 'FRONT', false, '${role_offline-access}', 'offline_access', 'FRONT', NULL, 'FRONT');
INSERT INTO public.keycloak_role VALUES ('282b3c25-fb38-4bda-96ff-087679995892', 'FRONT', false, '${role_uma_authorization}', 'uma_authorization', 'FRONT', NULL, 'FRONT');
INSERT INTO public.keycloak_role VALUES ('cfdc0fc9-d966-4f14-bca3-27d2bf6d1a54', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_create-client}', 'create-client', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('7fc6b75e-e6d2-4799-a137-1cf6fccf19ad', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-realm}', 'view-realm', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('0872818f-05b3-437a-94f4-cd4cf36d956e', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-users}', 'view-users', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('1cde913d-7dae-4d36-bd75-986cbf4a9e9a', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-clients}', 'view-clients', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('e6b7a996-f270-4ec7-88f0-bee8179a6530', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-events}', 'view-events', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('7d696583-3876-4801-ab6f-65243881c50d', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('8898c677-4fa7-4972-a70b-6a9e5a2fdf0f', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_view-authorization}', 'view-authorization', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('f2a57dac-56d7-4d20-98b4-bacc3f535c4a', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-realm}', 'manage-realm', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('0eb26353-d75d-4606-947c-990288909a06', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-users}', 'manage-users', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('8ac7f535-482a-4cd0-8a68-9e95e4302482', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-clients}', 'manage-clients', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('fc57f626-0c97-485f-a353-66e48e9168ce', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-events}', 'manage-events', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('dc8747d4-86be-4a0d-b428-bfb57d2ac2a9', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('b8a8a7b3-60aa-4dad-bd13-df95cc5f70b5', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_manage-authorization}', 'manage-authorization', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('e9383527-8320-4999-8d2e-9bdb33d7dc7f', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_query-users}', 'query-users', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('c5bf428e-2dde-4c80-a83a-e72ad72fafff', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_query-clients}', 'query-clients', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('ff1459ff-414c-46e4-bdad-2161f1e6f55f', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_query-realms}', 'query-realms', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('24e14748-aea7-4908-8b54-cd8a1c0ba6be', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_query-groups}', 'query-groups', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_realm-admin}', 'realm-admin', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('14190a50-329c-4f33-8275-f195fedcf3ee', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_create-client}', 'create-client', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('a2a45d63-cee7-43b4-b6d5-f7067aad1640', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-realm}', 'view-realm', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('e44b29cb-70ba-498a-88a3-7b98b0ade8cd', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-users}', 'view-users', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('b8eac30b-7982-4cd9-84a4-1c6570f86503', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-clients}', 'view-clients', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('ac0e9411-b67b-4b14-a8d9-09fdb5830dde', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-events}', 'view-events', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('69468a9f-f8ee-4de6-b7aa-ba0afcaf1a02', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-identity-providers}', 'view-identity-providers', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('f17bfa5d-240f-4546-8b22-b2cab66971c5', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_view-authorization}', 'view-authorization', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('29941611-a198-44aa-81c7-3eadbc278cea', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-realm}', 'manage-realm', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('3624d92a-a77e-45ab-9803-ea5ea9922b4b', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-users}', 'manage-users', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('a863f12a-ae2d-484f-98cb-08ffa84a497e', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-clients}', 'manage-clients', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('2709f748-0bb2-4f21-bd20-55f23a03d8c6', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-events}', 'manage-events', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('3be225df-e13c-45f4-b266-f584f17b7a27', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('82795ac2-889a-444a-a316-2b9fb605bea0', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_manage-authorization}', 'manage-authorization', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('6f7fb2a4-ce29-45e6-ba1c-cd2b85fb4397', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_query-users}', 'query-users', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('18e81483-9069-48bc-9617-cc192d83cdfd', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_query-clients}', 'query-clients', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('8144e680-6f56-40f1-9445-565dccc7bc25', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_query-realms}', 'query-realms', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('7a8f16f1-7151-4882-8263-bc67ec1e17c7', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_query-groups}', 'query-groups', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('b8f83c6a-0d16-4912-bba1-2b7a29e26fbd', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_view-profile}', 'view-profile', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_manage-account}', 'manage-account', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('d8e1834a-363c-4fc1-ab1e-c3d6a6235d81', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_manage-account-links}', 'manage-account-links', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('1dcf5925-cb4f-490d-a097-6221f86710dc', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_view-applications}', 'view-applications', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('59087fe4-77ae-41d8-a0da-e6102f01a05e', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_view-consent}', 'view-consent', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('34658f24-2368-43e6-8d3b-3d46e981bc66', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_manage-consent}', 'manage-consent', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('ccd8d67b-0344-484d-b428-6aa46aae5289', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', true, '${role_delete-account}', 'delete-account', 'PRIVATE', '2e0591bd-2ed2-47fc-9828-55aa08fd597f', NULL);
INSERT INTO public.keycloak_role VALUES ('c24174d0-1ae2-4f4c-b3c8-ea490c9638d5', '20f0ec1d-a977-4389-bac0-5d024b7e5681', true, '${role_impersonation}', 'impersonation', 'master', '20f0ec1d-a977-4389-bac0-5d024b7e5681', NULL);
INSERT INTO public.keycloak_role VALUES ('43e8dc52-5a19-43a4-9587-3ec511b0e43e', '46354b69-85ae-41a0-a35e-49682ac1a259', true, '${role_impersonation}', 'impersonation', 'PRIVATE', '46354b69-85ae-41a0-a35e-49682ac1a259', NULL);
INSERT INTO public.keycloak_role VALUES ('11392076-bdf4-4702-98e8-d1428772ac95', 'f87e6f05-bfe1-420d-9a97-afaa4a8f024e', true, '${role_read-token}', 'read-token', 'PRIVATE', 'f87e6f05-bfe1-420d-9a97-afaa4a8f024e', NULL);
INSERT INTO public.keycloak_role VALUES ('6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9', 'PRIVATE', false, '${role_offline-access}', 'offline_access', 'PRIVATE', NULL, 'PRIVATE');
INSERT INTO public.keycloak_role VALUES ('b3b1571d-04bc-4d55-a318-36d7fcae2453', 'PRIVATE', false, '${role_uma_authorization}', 'uma_authorization', 'PRIVATE', NULL, 'PRIVATE');
INSERT INTO public.keycloak_role VALUES ('1acacc43-0d2d-42b9-8a8f-d6f70199ed4f', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', true, NULL, 'uma_protection', 'PRIVATE', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.keycloak_role VALUES ('da7ce29a-4c6c-4ccb-a755-ceea7b179d9f', 'PRIVATE', false, NULL, 'PRIVATE_USER', 'PRIVATE', NULL, 'PRIVATE');
INSERT INTO public.keycloak_role VALUES ('a2031174-f933-4be6-8624-e51e2ccdabc9', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_create-client}', 'create-client', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('8adbfafc-383d-495d-b520-32d7f2671eb4', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-realm}', 'view-realm', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('f4f23bd2-8cc4-42a6-ac26-8d7db35a9ee0', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-users}', 'view-users', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('2b9bf73a-0ba9-4143-98c9-5dbdeed04d21', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-clients}', 'view-clients', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('af3882b0-f747-4828-a696-3e252f203180', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-events}', 'view-events', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('f2dab8ba-587b-42a2-9c75-e954fa69c355', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('50dd6260-225d-4eb3-acaa-9d52f2922d13', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_view-authorization}', 'view-authorization', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('e5974b90-4e34-40e4-8244-feefc3fc19c4', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-realm}', 'manage-realm', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('791646d2-ca8f-4157-89aa-7762de3764e8', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-users}', 'manage-users', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('8338b462-e17d-4bcb-ac8c-23a729628b43', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-clients}', 'manage-clients', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('4bdacf85-7225-472c-acf0-d9c30a44d673', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-events}', 'manage-events', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('75d88ca0-93a4-417b-9b4d-03568e54c465', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('76925f9b-c578-49a8-a1ac-dd9192931c58', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_manage-authorization}', 'manage-authorization', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('5e6dd88f-8a9d-42d7-b322-8b9abb33f9ae', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_query-users}', 'query-users', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('3013967b-a8d3-469d-8663-043fb41a10fc', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_query-clients}', 'query-clients', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('95af4cd8-024c-4eff-9f1d-a7bc15a3616e', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_query-realms}', 'query-realms', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('0e30b20a-aab2-4ad1-a2b6-c2de9f2a7e8a', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_query-groups}', 'query-groups', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('55d49da6-c757-4190-beb6-40aa877df5e7', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_realm-admin}', 'realm-admin', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('1db804bc-007b-493b-9ed8-091d047ecc39', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_create-client}', 'create-client', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('5d54c5c4-17ff-490f-b5d7-f6febbc78a5a', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-realm}', 'view-realm', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('78e59214-5829-4b85-9bc2-805497bbbd33', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-users}', 'view-users', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('80cc50b7-96c5-4cdf-b827-7bbf48ddb77e', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-clients}', 'view-clients', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('66314e5e-72e1-45f1-a167-3c6588827daa', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-events}', 'view-events', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('3c09e741-69d0-460d-81ac-b2bf7a7f7048', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-identity-providers}', 'view-identity-providers', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('22700f2c-b9d6-437e-a11a-bedf74921377', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_view-authorization}', 'view-authorization', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('71613923-f03c-4ad6-9ec2-041af63ae8f5', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-realm}', 'manage-realm', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('3cc090f4-b164-4ab6-acbe-5b729a3dc48c', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-users}', 'manage-users', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('c2f675e3-f3af-4c0d-9c82-1d111b03be1e', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-clients}', 'manage-clients', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('cd9dd234-bcfe-4416-98ea-c3a7183f838f', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-events}', 'manage-events', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('43501532-c622-4703-a660-f765c93c6ebd', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('796408c9-759e-4371-981c-b5546a42d22b', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_manage-authorization}', 'manage-authorization', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('42c1fde8-8f55-475a-a19c-51be3bef41ab', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_query-users}', 'query-users', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('0fe82f29-7ac0-400e-a4c8-93e21269bfa6', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_query-clients}', 'query-clients', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('90783c0f-f077-40ea-a32c-761084c8cc0b', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_query-realms}', 'query-realms', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('1a66e556-e883-4bc0-9f0a-586997d42fdd', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_query-groups}', 'query-groups', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('6bca112b-e6bc-4a33-b953-11500c629bd9', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_view-profile}', 'view-profile', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_manage-account}', 'manage-account', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('1ea4390e-966e-491a-a007-844011b565f4', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_manage-account-links}', 'manage-account-links', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('d9f77002-b18c-4802-ae60-1b5b31613d2f', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_view-applications}', 'view-applications', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('5570bf22-05ca-48ba-872a-1c8523606d06', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_view-consent}', 'view-consent', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('289f87e7-b038-4142-b988-9a62aad064b6', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_manage-consent}', 'manage-consent', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('8ccc2310-8298-45e5-b95f-c2fe3cbac2c9', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', true, '${role_delete-account}', 'delete-account', 'MULTIPLE-1', 'ba0d9db1-e6f2-4920-aedd-75aa3ee41908', NULL);
INSERT INTO public.keycloak_role VALUES ('5d1e4e22-1e49-4f23-937e-265f546d7783', '39b9946d-2797-4153-bd7f-ab3d436416d7', true, '${role_impersonation}', 'impersonation', 'master', '39b9946d-2797-4153-bd7f-ab3d436416d7', NULL);
INSERT INTO public.keycloak_role VALUES ('ed16fed3-2c5f-4c43-b1a5-06300a0b7f3a', 'f325300e-dbb1-4d03-9b37-531a5e57142f', true, '${role_impersonation}', 'impersonation', 'MULTIPLE-1', 'f325300e-dbb1-4d03-9b37-531a5e57142f', NULL);
INSERT INTO public.keycloak_role VALUES ('48a4fa36-44bb-44dd-aa35-21110be7b4af', '8a612982-28db-42e3-9709-70b705e8238c', true, '${role_read-token}', 'read-token', 'MULTIPLE-1', '8a612982-28db-42e3-9709-70b705e8238c', NULL);
INSERT INTO public.keycloak_role VALUES ('ba529c8b-25a6-4ee5-809a-3850f0c1489e', 'MULTIPLE-1', false, '${role_offline-access}', 'offline_access', 'MULTIPLE-1', NULL, 'MULTIPLE-1');
INSERT INTO public.keycloak_role VALUES ('aab595cc-017f-4b4e-968f-979e5cef40ed', 'MULTIPLE-1', false, '${role_uma_authorization}', 'uma_authorization', 'MULTIPLE-1', NULL, 'MULTIPLE-1');
INSERT INTO public.keycloak_role VALUES ('13c07da1-bc0d-42e4-8564-3bf430818749', '1b608b0b-5877-4161-ab41-a96362c18a25', true, NULL, 'uma_protection', 'MULTIPLE-1', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.keycloak_role VALUES ('fa099487-c89d-439a-bc1d-b1df480a95cc', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_create-client}', 'create-client', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('ee8da547-2fc7-4853-99a8-02f44819a345', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-realm}', 'view-realm', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('fb972670-20d5-482c-aad7-d987d0a0de13', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-users}', 'view-users', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('304bb27a-cd5c-4569-9ce5-7d0e3c520e9d', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-clients}', 'view-clients', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('4f654d1f-9fc1-4bd9-a776-a57888f31fed', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-events}', 'view-events', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('1d753867-e34d-47e1-ad35-bedb780b5c58', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('596cf08d-80a3-4cbc-b9c6-c21b841543b0', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_view-authorization}', 'view-authorization', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('39229924-3555-4251-beb8-d3e1ab274cca', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-realm}', 'manage-realm', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('cde58882-311e-4e4e-97ec-9c51e30f6753', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-users}', 'manage-users', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('d50cb9cb-a79c-41db-902d-bb17cd1e3147', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-clients}', 'manage-clients', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('64a5ade4-12a5-47c3-96ba-3cde04fe18df', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-events}', 'manage-events', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('14724bf0-5568-4001-8dcb-dbae4f0a4e30', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('5cfb07a2-928b-4349-b42b-b0f2c38287e5', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('8ab32ff3-91ff-469a-8833-3d92306657e3', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_query-users}', 'query-users', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('bca10549-4131-4e5c-b0bb-5b0afc8b7389', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_query-clients}', 'query-clients', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('48e7e14e-efb6-4362-9833-341e7edb40fd', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_query-realms}', 'query-realms', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('9fa231f6-69e5-4174-bd35-4a4ff566d6b8', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_query-groups}', 'query-groups', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('d586327a-c1ae-4d65-9725-7eafbbfcce25', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_realm-admin}', 'realm-admin', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('dd2f03f3-ad0a-41aa-8215-a071c45ac7c2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_create-client}', 'create-client', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('1a03b856-0e0e-44c7-85cc-81570003c46a', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-realm}', 'view-realm', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('e887c80c-d53e-41e7-a61f-16bc7d987cc8', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-users}', 'view-users', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('61a090bd-d90c-4956-841b-c67b4f91efa9', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-clients}', 'view-clients', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('dcbe46df-bf32-4dae-9a1b-6aa0530e5a77', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-events}', 'view-events', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('7686c11f-874f-4458-bca3-826008f9e6e7', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-identity-providers}', 'view-identity-providers', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('74437dbd-d5d6-4989-a9f5-46b581a184a3', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_view-authorization}', 'view-authorization', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('9fbebf96-a65b-4494-9818-892d6c40ab45', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-realm}', 'manage-realm', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('0108c7d9-4252-4c37-8926-3fdf9b1c4ee6', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-users}', 'manage-users', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('a0c349b8-c843-471b-984a-fcab1b01b40b', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-clients}', 'manage-clients', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('3191c199-f1d9-4910-af3b-cc170c4b9d48', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-events}', 'manage-events', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('433370c9-7279-43fb-bba2-3626b49c4b3a', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('5d64f8f8-2c7a-4b1f-a674-0a1693aea3df', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_manage-authorization}', 'manage-authorization', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('eff0d7bf-7968-4681-87da-d967f57304a6', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_query-users}', 'query-users', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('f2230d88-b1be-48c8-b620-4b4e4f6ef88f', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_query-clients}', 'query-clients', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('78c4152e-eefb-4ae6-9498-3ffe6591465a', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_query-realms}', 'query-realms', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('b332b59d-d40a-4e37-82e8-a91fdeef4fe1', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_query-groups}', 'query-groups', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('86009589-4589-4207-84d3-21ed456de9a3', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_view-profile}', 'view-profile', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_manage-account}', 'manage-account', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('cf8fc210-ca50-4c0e-9fe4-48625a138cd3', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_manage-account-links}', 'manage-account-links', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('6c3e8334-4d33-4c6f-9749-740cad58bbbb', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_view-applications}', 'view-applications', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('7341fd60-8879-4cdb-ae2f-a20dacf3bc92', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_view-consent}', 'view-consent', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('37da71b5-a508-4453-81f5-c76c7359978d', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_manage-consent}', 'manage-consent', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('08d445c6-79db-42b3-83e9-4a0fd874706b', '372c977c-6c7a-4df4-a175-567eb6dfdade', true, '${role_delete-account}', 'delete-account', 'MULTIPLE-2', '372c977c-6c7a-4df4-a175-567eb6dfdade', NULL);
INSERT INTO public.keycloak_role VALUES ('575897d2-14a8-4a93-915a-4b63712fa12e', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', true, '${role_impersonation}', 'impersonation', 'master', 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', NULL);
INSERT INTO public.keycloak_role VALUES ('028a6355-28b0-4983-83e1-f76ef4f33b3b', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', true, '${role_impersonation}', 'impersonation', 'MULTIPLE-2', 'f9247574-9b2b-4ee3-b708-5f7f7e700396', NULL);
INSERT INTO public.keycloak_role VALUES ('35710373-b367-4f02-8888-0e781f6c905f', '54d85bbb-c996-49a2-ae95-a5753ee96302', true, '${role_read-token}', 'read-token', 'MULTIPLE-2', '54d85bbb-c996-49a2-ae95-a5753ee96302', NULL);
INSERT INTO public.keycloak_role VALUES ('603d02e8-11c0-40fc-a29f-ce0768218ed9', 'MULTIPLE-2', false, '${role_offline-access}', 'offline_access', 'MULTIPLE-2', NULL, 'MULTIPLE-2');
INSERT INTO public.keycloak_role VALUES ('06399664-99af-42e6-9504-ab3ff4e61184', 'MULTIPLE-2', false, '${role_uma_authorization}', 'uma_authorization', 'MULTIPLE-2', NULL, 'MULTIPLE-2');
INSERT INTO public.keycloak_role VALUES ('1a9cbeb7-c563-4ae3-8bb8-10a165276293', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', true, NULL, 'uma_protection', 'MULTIPLE-2', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.migration_model VALUES ('pilna', '12.0.4', 1615297538);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.policy_config VALUES ('7648380b-8d5f-4be4-8e38-3b6bbb5c1357', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config VALUES ('55ce25a3-4655-46ea-8790-1968de43c309', 'defaultResourceType', 'urn:private-client:resources:default');
INSERT INTO public.policy_config VALUES ('0f3e6cab-2f44-4dd8-89cb-5b9b4c5945dc', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config VALUES ('ad64bd4c-c875-42e5-934a-c2047a6b1cbd', 'defaultResourceType', 'urn:multiple-1-client:resources:default');
INSERT INTO public.policy_config VALUES ('6b192cd8-a7ab-4f00-ae63-6872a7d9672e', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config VALUES ('1df07291-6f76-4912-b537-57b6101794f5', 'defaultResourceType', 'urn:multiple-2-client:resources:default');


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.protocol_mapper VALUES ('04030196-9498-404a-8696-6801d8a93065', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'bcaca2dd-6611-4085-9a59-498636f241c2', NULL);
INSERT INTO public.protocol_mapper VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '0fd56ece-f7b2-44af-b23c-d141d98accd0', NULL);
INSERT INTO public.protocol_mapper VALUES ('e0d2ac88-67e2-4515-b53f-8f2ab2b7b868', 'role list', 'saml', 'saml-role-list-mapper', NULL, '3b477f97-3980-4292-838a-06b6f5c1cd1c');
INSERT INTO public.protocol_mapper VALUES ('2ad41524-9643-4513-ac16-8a51c032e284', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '899db04f-fec1-4927-a1fc-1858db3fb9b1');
INSERT INTO public.protocol_mapper VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '550681ed-8385-40d7-ab96-e9362d9ea5d8');
INSERT INTO public.protocol_mapper VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '550681ed-8385-40d7-ab96-e9362d9ea5d8');
INSERT INTO public.protocol_mapper VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '999de5ea-c246-48b7-ac19-39656c5cbe65');
INSERT INTO public.protocol_mapper VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5f53e875-380b-4a5f-8868-35d3bf3fa68c');
INSERT INTO public.protocol_mapper VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5f53e875-380b-4a5f-8868-35d3bf3fa68c');
INSERT INTO public.protocol_mapper VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7');
INSERT INTO public.protocol_mapper VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7');
INSERT INTO public.protocol_mapper VALUES ('c78a2f89-f9cd-43da-a064-8d0cbe95ad67', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '0518f6e8-89ee-49ad-a5d9-0d8db8aae7a7');
INSERT INTO public.protocol_mapper VALUES ('635fc132-f010-42a1-86ba-fdbf267ebd46', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'c6fcac3d-1685-4d29-b9bf-817ef7d0f232');
INSERT INTO public.protocol_mapper VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'fd6de16c-7842-4017-be9a-71deec913efa');
INSERT INTO public.protocol_mapper VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'fd6de16c-7842-4017-be9a-71deec913efa');
INSERT INTO public.protocol_mapper VALUES ('9c381820-e154-4689-8334-4e0175e1170f', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '85351f64-5e1a-4aa5-afb9-d9cb24f80402', NULL);
INSERT INTO public.protocol_mapper VALUES ('62671271-97d6-4679-b724-795b4b3ce768', 'role list', 'saml', 'saml-role-list-mapper', NULL, '4405da81-2a2b-4635-b640-c6602e149249');
INSERT INTO public.protocol_mapper VALUES ('a54875d5-e9f6-4969-9ec2-ad114b3bcce7', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f0690f74-6443-4e88-b325-b1685b29e13b');
INSERT INTO public.protocol_mapper VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '83b17e4e-ece2-4f51-9e61-1a1eca679481');
INSERT INTO public.protocol_mapper VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '83b17e4e-ece2-4f51-9e61-1a1eca679481');
INSERT INTO public.protocol_mapper VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'd52b9d2d-fcbf-4971-a130-8f247c796b49');
INSERT INTO public.protocol_mapper VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2f381d78-5b8d-4141-ac75-ed1a79d8d32b');
INSERT INTO public.protocol_mapper VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2f381d78-5b8d-4141-ac75-ed1a79d8d32b');
INSERT INTO public.protocol_mapper VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '334c9858-805b-4009-b2ee-f41675423704');
INSERT INTO public.protocol_mapper VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '334c9858-805b-4009-b2ee-f41675423704');
INSERT INTO public.protocol_mapper VALUES ('dcf9e4bd-f936-4dd2-8ed8-61fc922a13a3', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '334c9858-805b-4009-b2ee-f41675423704');
INSERT INTO public.protocol_mapper VALUES ('b8f8c75b-9b19-4586-8ca9-accbd1ca1e5e', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'e68f954d-f7e1-44c3-a342-1f6e6cf3eec0');
INSERT INTO public.protocol_mapper VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1');
INSERT INTO public.protocol_mapper VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e7e4d14c-7d5a-42a6-986b-5505fa5432b1');
INSERT INTO public.protocol_mapper VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'f42b647b-be8a-424e-841f-16dcc17fd78d', NULL);
INSERT INTO public.protocol_mapper VALUES ('9e17f16c-60c0-474e-af42-f0c77da2325c', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '097a05b2-ab65-4e87-84f3-1ec120dd745a', NULL);
INSERT INTO public.protocol_mapper VALUES ('8154d520-71f8-490a-b97c-bffca2fa7ad0', 'role list', 'saml', 'saml-role-list-mapper', NULL, '3699b254-0664-4b07-9e7a-d968bdad3df8');
INSERT INTO public.protocol_mapper VALUES ('4bd9bdc5-8a5b-40f2-b5e2-c17122807663', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3081cb26-994c-4e00-ae3e-a82637769dd0');
INSERT INTO public.protocol_mapper VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7671b352-cec6-4316-b98a-437d4c9beb50');
INSERT INTO public.protocol_mapper VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7671b352-cec6-4316-b98a-437d4c9beb50');
INSERT INTO public.protocol_mapper VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'dd571a9c-e5f6-419b-bb83-3de8000c65f8');
INSERT INTO public.protocol_mapper VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84');
INSERT INTO public.protocol_mapper VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '08d9a9c1-be0c-4cd8-a866-b5ac1f13ed84');
INSERT INTO public.protocol_mapper VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '9aa56e87-5d61-4c77-b350-22f7bd22dc77');
INSERT INTO public.protocol_mapper VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '9aa56e87-5d61-4c77-b350-22f7bd22dc77');
INSERT INTO public.protocol_mapper VALUES ('f01843b4-28fe-4af5-b681-68fc5a05ca07', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '9aa56e87-5d61-4c77-b350-22f7bd22dc77');
INSERT INTO public.protocol_mapper VALUES ('ce2bc0e3-768d-4a47-a5a5-d5bc74b58eea', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '75fd9f90-1839-4625-8edc-1583f9d237c7');
INSERT INTO public.protocol_mapper VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'e036bf2e-0de5-4061-b86b-78a9ac863f82');
INSERT INTO public.protocol_mapper VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e036bf2e-0de5-4061-b86b-78a9ac863f82');
INSERT INTO public.protocol_mapper VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '966e01a0-fa00-4246-8e61-2bd871ab9877', NULL);
INSERT INTO public.protocol_mapper VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.protocol_mapper VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.protocol_mapper VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.protocol_mapper VALUES ('4268958e-685a-4597-b232-e02423b52257', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '2d0e64db-409b-4218-8559-39ca53556fed', NULL);
INSERT INTO public.protocol_mapper VALUES ('6ac2e612-3331-4e15-b378-430e3923ca13', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'ffb8a4b5-4a88-47db-ba96-466cabb4782d');
INSERT INTO public.protocol_mapper VALUES ('ffbf91d1-f1d1-4185-8fc1-aaecc5a61154', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1f83de5f-37aa-49d9-81fb-409e19ec3376');
INSERT INTO public.protocol_mapper VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8fbf8034-afbf-4040-9ec5-ec032802d961');
INSERT INTO public.protocol_mapper VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8fbf8034-afbf-4040-9ec5-ec032802d961');
INSERT INTO public.protocol_mapper VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'f4697e9b-4da9-43aa-ad21-6b9e10113314');
INSERT INTO public.protocol_mapper VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3c13a0ee-606c-44e4-86b2-b73a965d3299');
INSERT INTO public.protocol_mapper VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3c13a0ee-606c-44e4-86b2-b73a965d3299');
INSERT INTO public.protocol_mapper VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'b2ace36e-f791-4587-a1e5-466e6df5fb35');
INSERT INTO public.protocol_mapper VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'b2ace36e-f791-4587-a1e5-466e6df5fb35');
INSERT INTO public.protocol_mapper VALUES ('c9b352e3-b287-41af-aec1-a1d66f20956c', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'b2ace36e-f791-4587-a1e5-466e6df5fb35');
INSERT INTO public.protocol_mapper VALUES ('1be2b386-664a-4fea-a5a8-89b1beede91f', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '6e375a5a-2cc1-456f-9323-7ead1e0d485f');
INSERT INTO public.protocol_mapper VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'c5df37e4-6b8d-45a8-b005-327efe82b248');
INSERT INTO public.protocol_mapper VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'c5df37e4-6b8d-45a8-b005-327efe82b248');
INSERT INTO public.protocol_mapper VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '053fbb7b-a3ca-49c2-9888-20143c365d28', NULL);
INSERT INTO public.protocol_mapper VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.protocol_mapper VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.protocol_mapper VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.protocol_mapper VALUES ('de67c867-f459-464d-ab15-58a7f9dc0c57', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '98be72a6-8f42-4961-869c-f78fc6873bf9', NULL);
INSERT INTO public.protocol_mapper VALUES ('e8ec9b96-5db7-4f4f-89cf-67117831f6cd', 'role list', 'saml', 'saml-role-list-mapper', NULL, '6dab14c3-5ac0-4377-99e3-eaefadf7d47c');
INSERT INTO public.protocol_mapper VALUES ('085365d2-95b7-43ed-be2f-7ddb9be2e9bc', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3473998a-007f-450e-82c7-cc0bcf5e47b0');
INSERT INTO public.protocol_mapper VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '56d220d0-0834-442f-a089-982de60c31a3');
INSERT INTO public.protocol_mapper VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '56d220d0-0834-442f-a089-982de60c31a3');
INSERT INTO public.protocol_mapper VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '090910ec-4835-4119-8494-cf35d3d421b4');
INSERT INTO public.protocol_mapper VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6f603f25-df06-48a1-b072-5d9f813f1d28');
INSERT INTO public.protocol_mapper VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6f603f25-df06-48a1-b072-5d9f813f1d28');
INSERT INTO public.protocol_mapper VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'd7b29718-8706-48c4-a971-080ad4a9d566');
INSERT INTO public.protocol_mapper VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'd7b29718-8706-48c4-a971-080ad4a9d566');
INSERT INTO public.protocol_mapper VALUES ('df8cb01d-291b-4a6c-a443-9405e815d674', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'd7b29718-8706-48c4-a971-080ad4a9d566');
INSERT INTO public.protocol_mapper VALUES ('ef9672d9-ed84-4b0a-833c-d9ed6849eec6', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'b23103d8-b4e5-4997-b762-5e26299b62dd');
INSERT INTO public.protocol_mapper VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '5201565d-e810-4525-bd7e-cfab2a376e1f');
INSERT INTO public.protocol_mapper VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '5201565d-e810-4525-bd7e-cfab2a376e1f');
INSERT INTO public.protocol_mapper VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '00567daa-d087-40fc-beae-791ff3c17dba', NULL);
INSERT INTO public.protocol_mapper VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);
INSERT INTO public.protocol_mapper VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);
INSERT INTO public.protocol_mapper VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6a6eb14b-bf38-4828-bffe-122118a9b247', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e0d2ac88-67e2-4515-b53f-8f2ab2b7b868', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('e0d2ac88-67e2-4515-b53f-8f2ab2b7b868', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('e0d2ac88-67e2-4515-b53f-8f2ab2b7b868', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('2ad41524-9643-4513-ac16-8a51c032e284', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2ad41524-9643-4513-ac16-8a51c032e284', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2ad41524-9643-4513-ac16-8a51c032e284', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('417e976e-2d3a-49a2-9edf-9b5b94f39659', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ea4cd838-60ff-4017-9ddb-bc80608dbcad', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7b1e301c-a7b3-46ee-ac62-5db3c5c4b763', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fdeaf15f-37b4-4296-a9e0-a62b9406ba94', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ba48ef9d-8384-462d-ac80-c5d9d6a111b1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('dbadc8ab-8535-4811-a83a-5da49f30181e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('00f17848-2271-4d35-ab07-9ade6f1532ca', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('da824ed1-ac79-4bbf-922f-e28f6f9b3ad4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7299db8f-e726-41fd-b94b-a6a8d71afdbd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f9e4d84d-208f-427a-a4d1-50d0f86233c7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f243e92f-442f-45f1-9129-147290116e00', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3734e37b-7137-48e1-87f0-31fe18c94aec', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b73c5933-d738-4087-80c2-811e723604b6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('475f34a2-a0f4-47b6-98e2-730ed1cd49ab', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ece4f918-b66d-4cd0-99b6-b458aaf3e5bd', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('804490da-42b3-408e-b22e-941e82700f01', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4f43c00c-5c47-4cb3-a490-570e9e66f634', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('27535592-2da8-469c-8e83-1aebc91499cc', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('47636b78-54a3-4463-9bcf-660f113328ec', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7d74e06a-cbaf-4a20-a27e-5505b724498f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0feb16a4-6d0c-4161-a9eb-48633a0ad0a5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('265c7ee7-0402-4228-8ac6-93117cc03804', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('62671271-97d6-4679-b724-795b4b3ce768', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('62671271-97d6-4679-b724-795b4b3ce768', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('62671271-97d6-4679-b724-795b4b3ce768', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('a54875d5-e9f6-4969-9ec2-ad114b3bcce7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a54875d5-e9f6-4969-9ec2-ad114b3bcce7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a54875d5-e9f6-4969-9ec2-ad114b3bcce7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0fec283a-0e78-4075-90e6-264a343fb0e7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a42c8cb8-2f64-4a58-b81e-a23c556012d1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fdf8be46-1e19-4919-ad77-3e52aee60f91', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('948b0b14-e027-4906-b1fa-1e4e47c62693', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9b057c9e-b288-4c80-9234-aa36861e5c12', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('161f0fc9-5346-4610-9b53-de3c1a94f26c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('484ac39a-4437-4a90-87e9-576bfaff13bf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('777bec71-d675-40bd-8911-3a646495d0f4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('32f452ae-7ae5-41ab-8ed0-bbe49c8cfda9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0d049510-bc9a-452e-9e9d-b05d822d2d3f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6f1c2c54-6276-4290-874f-3b97377ad30b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b4980a90-6968-48ca-a2e7-326689a2f8fa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1d7f553f-f1e0-4a8b-81f0-3adf90f5211c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8eb06fea-64aa-45cc-8068-fdca578a8f6a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('619c245f-a28b-4518-b4e8-f202016bfd77', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51ff4f0c-60e6-4a8b-82d4-6766afaac0cb', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c9ce4b39-e420-43b3-a8e0-78af05ef6eac', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('417ab06d-00cc-4bb8-8253-d589ba7cf89e', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('877c37dd-7585-4714-8945-87fa76f9338d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fe2efcec-e558-47da-8e07-c58d21c9bd78', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('90a1765d-a0f3-4136-9e4f-ac7faf07e63e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ddb23ce5-5d39-466f-b670-810f539ad80a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('aa391ec8-2fe5-444e-bc44-9ace77cb0969', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8154d520-71f8-490a-b97c-bffca2fa7ad0', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('8154d520-71f8-490a-b97c-bffca2fa7ad0', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('8154d520-71f8-490a-b97c-bffca2fa7ad0', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('4bd9bdc5-8a5b-40f2-b5e2-c17122807663', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4bd9bdc5-8a5b-40f2-b5e2-c17122807663', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4bd9bdc5-8a5b-40f2-b5e2-c17122807663', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('65b1644e-a714-44e1-bb6a-eeca1d63c0c2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('030a0fe8-9339-4e34-b17c-6cfcbf160142', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1bc0d6d6-e8bd-474f-aab9-b2d278bf512f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3c63a5ea-91c7-484a-ab08-1b15dc0e1cf3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('62ba111c-e386-4a75-a444-27e13971d45b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ea161921-8ccf-4e76-bdee-000fd6a3f89a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0b5678f7-3a92-411b-8e26-d0ba5abddc26', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a925c291-7b48-44c4-bb1f-b0f5dd636343', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('18ba2adc-a502-4993-86ac-e1b695671702', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b9a287d9-bf3e-429f-82c2-26ed6f5135c7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('37030f48-b8cf-4a4a-bde6-ce24507fa1f8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('26c480a6-a77b-4bca-b143-2dc625ca07cc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e52705eb-0249-409b-bf5e-e26e9e10c7b5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('219b8e3e-69dd-4e88-9b5e-6e4a5aa5a8d4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('69197490-886f-4dd0-9405-0b94ad0ca069', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('88052e61-5ceb-4687-9cfd-c46ae05f654c', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5ec19fed-5d64-4227-ae2e-7b66483124fa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f3a897df-ce9e-4323-b572-924879acfdbf', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2a6817cb-5d33-41f9-aba6-d7de0ab56555', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f0a579d1-ba8c-4db8-bdeb-1910e4cc8cad', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1af92f44-0c03-45ed-9363-8cd495532d93', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6f833071-958d-4e88-adb3-a1ae4e42ff05', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bfd7e335-0302-4bca-8bcd-852099a2b584', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('345314ac-13dd-406e-bc0e-572e4a603519', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e4cadeb9-a82f-4548-a7ca-a18712ff68b2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48bd75a4-b4a1-4a6c-aa00-0f237ad52085', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6ac2e612-3331-4e15-b378-430e3923ca13', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('6ac2e612-3331-4e15-b378-430e3923ca13', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('6ac2e612-3331-4e15-b378-430e3923ca13', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('ffbf91d1-f1d1-4185-8fc1-aaecc5a61154', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ffbf91d1-f1d1-4185-8fc1-aaecc5a61154', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ffbf91d1-f1d1-4185-8fc1-aaecc5a61154', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('44376175-c1e9-4cb2-9737-62aa455e67a8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b1751202-71f0-47df-b810-71ff787ef3fc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fa0908bf-8826-41a6-92e3-2354ae7d7c98', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cab368b1-78ad-456d-b314-40d465fe03cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e96152fc-480b-40ab-99a4-919574f5935c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a4f966d8-d540-440b-a37c-3b851cb9a998', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9a54c4ae-80f1-4f28-b70f-3c100a85d757', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cd8d83a6-9f54-4e9a-8714-e2ce23a813ff', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('58cb88ae-2354-40d3-b7f9-913351287d81', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2711d41b-3a5d-40e0-a7de-4fd499535042', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5e83444c-40b0-4a87-86d9-448872e1e20b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b9174730-7933-4995-9ce5-b87c53b873f9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f6531a98-4459-4f5a-ab62-46693a9b0a9b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('08fbd088-a4c9-4769-8b04-4a0678ed2c38', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('de4e50b9-9602-4355-b578-175fc76036c3', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('961eedde-09c4-499f-9e88-1716d17b7591', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('73eefa33-7317-43a3-9922-cd5ec44822c6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bd75efa4-e8be-4cb7-b2c2-2bfea526537e', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9b51514c-9fcf-49db-98e1-80368f65a326', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('58df79d7-8078-425b-8020-6caba8afb1de', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2e1f1b2e-a7e2-4adb-9cc3-9e708d9e1bb2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a0240c75-b1d7-4525-8e35-69799c8336d8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e6d2cea3-d523-4ba2-9c0c-e93d53e57ef4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e41369d2-448a-491e-884e-c167b82556f2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('06965915-5d88-4cd8-8719-f6985768d87a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('886a1119-ca46-421d-95ec-a83b182906e4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e8ec9b96-5db7-4f4f-89cf-67117831f6cd', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('e8ec9b96-5db7-4f4f-89cf-67117831f6cd', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('e8ec9b96-5db7-4f4f-89cf-67117831f6cd', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('085365d2-95b7-43ed-be2f-7ddb9be2e9bc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('085365d2-95b7-43ed-be2f-7ddb9be2e9bc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('085365d2-95b7-43ed-be2f-7ddb9be2e9bc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9f3e6307-a576-4671-bde0-462ef41fbfbd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f662ec50-05ca-457c-909c-2ecfc43dd0a2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('d5876b01-071e-48e2-84f4-6facb91edd99', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('427cc439-35f8-44b3-9ec5-af7fda13e0e1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0507610b-ecf2-474b-bd64-b9b7ecf67ea3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8f7f2f55-6d3f-43b6-9956-61d85cdcaec4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('621d06fa-bd5c-4c5a-9de5-de0adde603c0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('414ff1ea-5254-4b6a-b292-7c18eb29723d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f3531718-d6a3-4d0c-949e-50b44cd49536', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6be7f799-c870-488c-8676-8b507d0d9ddf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('92050f84-0723-4516-b8f9-5ec5d98edaa5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2d89b29c-d8b2-4944-80f7-acb31af1ba5a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('21354e9f-19b2-4bee-9dc8-ea72822337cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2335bfc0-f74e-465f-94f6-45ac60ef9f9a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1f6ededf-b940-4f1b-8fbc-d2397022322e', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09e4b65d-c5db-4906-ae49-553557394a42', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7dbd8204-6c1d-4206-ab8f-b25ed275dbd7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('da7cbae7-12a9-4cd7-bcf1-d7364efdc67b', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6bec41ec-fe04-4efd-8d03-e919f82bb42a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('68f772ab-93a4-4718-bf25-b4023a161866', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6faac338-6aae-47e5-8087-8db094fc8399', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cad9f0be-cef3-4a71-a0e6-bdb42511f386', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ed4e48af-1ba1-46c6-8d46-2df086f17ce5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ee00634f-5643-4900-a902-40e26b3e7761', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('771d4450-2b53-4425-a4f6-471f283cd565', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('d3a281e7-4eac-40fc-8061-798b893e5614', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm VALUES ('PRIVATE', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'PRIVATE', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '20f0ec1d-a977-4389-bac0-5d024b7e5681', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '3f9bcd52-0f4b-4958-aba4-28dd19cc80dd', 'afe6f39b-9ed4-490d-9c83-53b1dc2fc184', '3dfcbc64-d58b-4b9b-be5a-8b9796272af3', '5a52c6b8-0f6f-4fbe-932b-f8ee7d99d6a5', 'f9e7a0be-e971-4add-aa64-766f8d4bd925', 2592000, false, 900, true, false, 'ee804575-73d8-4b85-8321-48b73d91f607', 0, false, 0, 0);
INSERT INTO public.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '1479f416-834e-40dd-b0cd-1417612491bf', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'e3ca8a0b-f2a0-4708-b95b-9c8c7177955d', 'cde407a2-b40e-4622-837a-2f878ebcfd21', '4b233f33-8b76-48c3-9cd2-c13bc4e8049a', '55cca2aa-a766-4f62-abf1-3668615e78cc', '45017b66-884b-4ff8-a839-cc1600f6255d', 2592000, false, 900, true, false, '53989273-1267-4c56-b4d9-411956c872dc', 0, false, 0, 0);
INSERT INTO public.realm VALUES ('FRONT', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'FRONT', 0, NULL, false, false, false, false, 'NONE', 1800, 36000, false, false, 'ab45847f-eb1d-4268-94ca-9c5577f34d7e', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '77a905ee-a1f6-4c22-a891-057d5c1aaf50', '995d8bbd-7e57-45aa-ac5e-897778f2c106', '800bcba7-6b80-4747-8a89-278ac11beb14', '2ddb73a1-7125-4558-bf44-e4d994de73ed', '2a699451-16ae-48a0-bd55-d7273d571d29', 2592000, false, 900, true, false, '156fc7e6-bced-4767-a852-1a2b33b6d618', 0, false, 0, 0);
INSERT INTO public.realm VALUES ('MULTIPLE-1', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'MULTIPLE-1', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '39b9946d-2797-4153-bd7f-ab3d436416d7', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '7821d025-c3eb-4585-a7d0-34e8a409da02', '8e7190a7-dec6-4df7-86cb-c08a7fb5d5ea', '6bd15fa5-f7fc-4ba6-a288-cae884887c60', 'ae03d859-849b-493b-b762-acc96c667629', '2fb6e2f0-2be6-4667-9b75-49f4a3a91eaf', 2592000, false, 900, true, false, 'e4325e59-1e61-4395-ba88-48e1b78d4f56', 0, false, 0, 0);
INSERT INTO public.realm VALUES ('MULTIPLE-2', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'MULTIPLE-2', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, 'd5d8ec7b-56e9-4fb9-adeb-79efa40b0273', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'ccbd755f-b0ce-45db-a84c-da07c2ac44e0', '554f1567-a51d-4ee0-8f4b-d8c00e2ac47d', '5712f937-3513-43c5-bc1f-fe7f686c40d3', 'ed1a1ce2-5c91-41b9-9bea-c08e08a21720', 'eb8239d7-d885-4447-a6d4-319be8278504', 2592000, false, 900, true, false, 'a6c6895e-a899-4f55-9589-70662019b56d', 0, false, 0, 0);


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'master');
INSERT INTO public.realm_attribute VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '<div class="kc-logo-text"><span>Keycloak</span></div>', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'PRIVATE');
INSERT INTO public.realm_attribute VALUES ('clientSessionIdleTimeout', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('clientSessionMaxLifespan', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionIdleTimeout', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionMaxLifespan', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'FRONT');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'MULTIPLE-1');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'MULTIPLE-2');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'MULTIPLE-2');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_default_roles VALUES ('master', 'cc936d10-11d6-4455-a701-5e91bbccf24d');
INSERT INTO public.realm_default_roles VALUES ('master', 'd27a49d3-fba8-49d9-8855-f3305a06d00b');
INSERT INTO public.realm_default_roles VALUES ('FRONT', '9c020280-88eb-46f1-81a6-431ee2962be6');
INSERT INTO public.realm_default_roles VALUES ('FRONT', '282b3c25-fb38-4bda-96ff-087679995892');
INSERT INTO public.realm_default_roles VALUES ('PRIVATE', '6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9');
INSERT INTO public.realm_default_roles VALUES ('PRIVATE', 'b3b1571d-04bc-4d55-a318-36d7fcae2453');
INSERT INTO public.realm_default_roles VALUES ('MULTIPLE-1', 'ba529c8b-25a6-4ee5-809a-3850f0c1489e');
INSERT INTO public.realm_default_roles VALUES ('MULTIPLE-1', 'aab595cc-017f-4b4e-968f-979e5cef40ed');
INSERT INTO public.realm_default_roles VALUES ('MULTIPLE-2', '603d02e8-11c0-40fc-a29f-ce0768218ed9');
INSERT INTO public.realm_default_roles VALUES ('MULTIPLE-2', '06399664-99af-42e6-9504-ab3ff4e61184');


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_events_listeners VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('FRONT', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('PRIVATE', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('MULTIPLE-1', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('MULTIPLE-2', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'FRONT');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'PRIVATE');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'MULTIPLE-1');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'MULTIPLE-2');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.redirect_uris VALUES ('db11acde-c6f6-4d2e-8f32-8e006466f05d', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '/admin/master/console/*');
INSERT INTO public.redirect_uris VALUES ('0e37e996-c751-4130-8b1b-d5b4c112ee20', '/realms/FRONT/account/*');
INSERT INTO public.redirect_uris VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '/realms/FRONT/account/*');
INSERT INTO public.redirect_uris VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '/admin/FRONT/console/*');
INSERT INTO public.redirect_uris VALUES ('e128d539-065f-42ce-a255-4999494942d6', 'https://localhost:4200');
INSERT INTO public.redirect_uris VALUES ('2e0591bd-2ed2-47fc-9828-55aa08fd597f', '/realms/PRIVATE/account/*');
INSERT INTO public.redirect_uris VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '/realms/PRIVATE/account/*');
INSERT INTO public.redirect_uris VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '/admin/PRIVATE/console/*');
INSERT INTO public.redirect_uris VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', 'http://localhost:8090/');
INSERT INTO public.redirect_uris VALUES ('ba0d9db1-e6f2-4920-aedd-75aa3ee41908', '/realms/MULTIPLE-1/account/*');
INSERT INTO public.redirect_uris VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', '/realms/MULTIPLE-1/account/*');
INSERT INTO public.redirect_uris VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '/admin/MULTIPLE-1/console/*');
INSERT INTO public.redirect_uris VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', 'http://localhost:8090/');
INSERT INTO public.redirect_uris VALUES ('372c977c-6c7a-4df4-a175-567eb6dfdade', '/realms/MULTIPLE-2/account/*');
INSERT INTO public.redirect_uris VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', '/realms/MULTIPLE-2/account/*');
INSERT INTO public.redirect_uris VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '/admin/MULTIPLE-2/console/*');
INSERT INTO public.redirect_uris VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', 'http://localhost:8090/');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.required_action_provider VALUES ('abb760d5-22e8-49c8-90dc-a1c08333af28', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('6ff0f8d6-74fb-434d-a9d4-b7cc7935b924', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('8a824e6f-bdbd-432d-b9da-c32db97627f3', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('54833fcd-c6a0-4180-b393-99413698912c', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('b399a32a-dfa3-46bf-b0ea-7ada2dd96a3b', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('60e3b863-2905-4115-bf66-c01bc949c00b', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('956aa850-8b87-433e-af51-494ec4dcf459', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('c5375178-9f6d-4a15-b6e8-0cea8839f95d', 'VERIFY_EMAIL', 'Verify Email', 'FRONT', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('752194dc-bced-42eb-a845-8c6669d6373f', 'UPDATE_PROFILE', 'Update Profile', 'FRONT', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('5bd48588-67bc-43cf-a2d2-8a660b1ac7b3', 'CONFIGURE_TOTP', 'Configure OTP', 'FRONT', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('3c771fc2-5b75-43cc-b763-9d6191ecda64', 'UPDATE_PASSWORD', 'Update Password', 'FRONT', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('a8dd3330-cb81-4739-b883-b064020d341f', 'terms_and_conditions', 'Terms and Conditions', 'FRONT', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('03060dfe-cd3f-4dea-8ea7-b1af8a4c874f', 'update_user_locale', 'Update User Locale', 'FRONT', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('fab04b86-d444-46eb-b813-d309a31a77cd', 'delete_account', 'Delete Account', 'FRONT', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('abbadd6f-afe9-4318-a3d0-7dd193b8dd9e', 'VERIFY_EMAIL', 'Verify Email', 'PRIVATE', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('f94690c1-16f2-4c4a-a38a-1b432b943f8d', 'UPDATE_PROFILE', 'Update Profile', 'PRIVATE', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('f2d4f465-cdad-4871-ae6b-978a1d0757be', 'CONFIGURE_TOTP', 'Configure OTP', 'PRIVATE', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('17a3c147-e360-4100-a2ab-d5f9f8da0796', 'UPDATE_PASSWORD', 'Update Password', 'PRIVATE', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('5e1b2a73-93e6-4a11-9a63-5a64f59259e5', 'terms_and_conditions', 'Terms and Conditions', 'PRIVATE', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('79121fa5-2026-4bbe-b8c1-f476b5b8a62b', 'update_user_locale', 'Update User Locale', 'PRIVATE', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('54f901e9-49f6-4822-af1d-3e3db2c79ce2', 'delete_account', 'Delete Account', 'PRIVATE', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('0b8f861e-6760-46aa-a6ef-83711215b23d', 'VERIFY_EMAIL', 'Verify Email', 'MULTIPLE-1', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('b2591197-8ee9-4cb7-ad05-63ce9402722f', 'UPDATE_PROFILE', 'Update Profile', 'MULTIPLE-1', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('b3504556-a844-4bb0-89d3-5bf22d6fd93a', 'CONFIGURE_TOTP', 'Configure OTP', 'MULTIPLE-1', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('82ae3ac2-f6be-49a6-9b69-ec0ce09c6c81', 'UPDATE_PASSWORD', 'Update Password', 'MULTIPLE-1', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('0042749b-f0c3-433b-9481-0cd417aad9ea', 'terms_and_conditions', 'Terms and Conditions', 'MULTIPLE-1', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('a0f9af6d-3ace-4226-9213-bc49fcf0819d', 'update_user_locale', 'Update User Locale', 'MULTIPLE-1', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('183326b2-9e16-4fca-b3e6-926d5af7c398', 'delete_account', 'Delete Account', 'MULTIPLE-1', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('5679e636-ef80-4ae0-9787-59ede5f6efff', 'VERIFY_EMAIL', 'Verify Email', 'MULTIPLE-2', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('0559d55f-6ae9-4577-ac94-bc0ab2a44c27', 'UPDATE_PROFILE', 'Update Profile', 'MULTIPLE-2', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('2ef18056-e503-41f9-a172-34feea7da9fc', 'CONFIGURE_TOTP', 'Configure OTP', 'MULTIPLE-2', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('24267159-fea3-4c56-91dd-32ffc2802059', 'UPDATE_PASSWORD', 'Update Password', 'MULTIPLE-2', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('2b205a82-67fd-4716-882d-451dbeeb8f48', 'terms_and_conditions', 'Terms and Conditions', 'MULTIPLE-2', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('3df0e016-68eb-4072-9de9-676f3bcd47ff', 'update_user_locale', 'Update User Locale', 'MULTIPLE-2', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('c164ef3e-0ebc-44cd-bc58-51af06a401df', 'delete_account', 'Delete Account', 'MULTIPLE-2', false, false, 'delete_account', 60);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.resource_server VALUES ('cd03dabe-d1d7-489f-9e95-ec824c985f08', true, '0', 1);
INSERT INTO public.resource_server VALUES ('1b608b0b-5877-4161-ab41-a96362c18a25', true, '0', 1);
INSERT INTO public.resource_server VALUES ('e7000013-78f1-40b5-8eb0-04aa09e8f169', true, '0', 1);


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.resource_server_policy VALUES ('7648380b-8d5f-4be4-8e38-3b6bbb5c1357', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.resource_server_policy VALUES ('55ce25a3-4655-46ea-8790-1968de43c309', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', NULL);
INSERT INTO public.resource_server_policy VALUES ('0f3e6cab-2f44-4dd8-89cb-5b9b4c5945dc', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.resource_server_policy VALUES ('ad64bd4c-c875-42e5-934a-c2047a6b1cbd', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '1b608b0b-5877-4161-ab41-a96362c18a25', NULL);
INSERT INTO public.resource_server_policy VALUES ('6b192cd8-a7ab-4f00-ae63-6872a7d9672e', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);
INSERT INTO public.resource_server_policy VALUES ('1df07291-6f76-4912-b537-57b6101794f5', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', NULL);


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.resource_server_resource VALUES ('8bb7b04e-4ed4-450b-a658-a5c47dee112a', 'Default Resource', 'urn:private-client:resources:default', NULL, 'cd03dabe-d1d7-489f-9e95-ec824c985f08', 'cd03dabe-d1d7-489f-9e95-ec824c985f08', false, NULL);
INSERT INTO public.resource_server_resource VALUES ('38205ff5-ed08-454e-ac97-f6129d2a30ce', 'Default Resource', 'urn:multiple-1-client:resources:default', NULL, '1b608b0b-5877-4161-ab41-a96362c18a25', '1b608b0b-5877-4161-ab41-a96362c18a25', false, NULL);
INSERT INTO public.resource_server_resource VALUES ('093b4df8-77f3-4901-83b7-66140ac2e421', 'Default Resource', 'urn:multiple-2-client:resources:default', NULL, 'e7000013-78f1-40b5-8eb0-04aa09e8f169', 'e7000013-78f1-40b5-8eb0-04aa09e8f169', false, NULL);


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.resource_uris VALUES ('8bb7b04e-4ed4-450b-a658-a5c47dee112a', '/*');
INSERT INTO public.resource_uris VALUES ('38205ff5-ed08-454e-ac97-f6129d2a30ce', '/*');
INSERT INTO public.resource_uris VALUES ('093b4df8-77f3-4901-83b7-66140ac2e421', '/*');


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.scope_mapping VALUES ('bcaca2dd-6611-4085-9a59-498636f241c2', '54698925-844c-4dcc-b505-4629d5a6191e');
INSERT INTO public.scope_mapping VALUES ('85351f64-5e1a-4aa5-afb9-d9cb24f80402', '1d74ae8d-2aa0-4118-a1bb-ae42f563923a');
INSERT INTO public.scope_mapping VALUES ('097a05b2-ab65-4e87-84f3-1ec120dd745a', '5a7f1fa1-1419-4387-a8f4-e52e1415fb7b');
INSERT INTO public.scope_mapping VALUES ('2d0e64db-409b-4218-8559-39ca53556fed', 'b416307b-5684-4bde-ac76-31a8ad58f11b');
INSERT INTO public.scope_mapping VALUES ('98be72a6-8f42-4961-869c-f78fc6873bf9', 'ba49cc6b-a283-4227-8ab4-2ea356cc16fb');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.user_entity VALUES ('01c4968a-56d8-4cc0-84d2-4f77cfb0142a', NULL, '9181d25f-8777-473e-8a3f-7cfe57a2fdaf', false, true, NULL, NULL, NULL, 'master', 'admin', 1615297789339, NULL, 0);
INSERT INTO public.user_entity VALUES ('ac4088d2-82e6-4087-8edf-3b7b5d72cf32', NULL, '204146cb-9519-44bd-a480-46a1e127553a', false, true, NULL, NULL, NULL, 'PRIVATE', 'service-account-private-client', 1615299714569, 'cd03dabe-d1d7-489f-9e95-ec824c985f08', 0);
INSERT INTO public.user_entity VALUES ('146c0cdb-130e-4dc2-b158-05bf2f6161cb', 'jco@yopmail.com', 'jco@yopmail.com', true, true, NULL, NULL, NULL, 'PRIVATE', 'jco', 1615306344929, NULL, 0);
INSERT INTO public.user_entity VALUES ('3fd205f6-d93b-4c04-9760-90a7ccd517ea', 'jcorha@yopmail.com', 'jcorha@yopmail.com', true, true, NULL, NULL, NULL, 'PRIVATE', 'jcorha', 1615307030682, NULL, 0);
INSERT INTO public.user_entity VALUES ('0b491d91-a740-4c51-9ce7-6f51dd5a277c', 'joo@yopmail.com', 'joo@yopmail.com', true, true, NULL, NULL, NULL, 'PRIVATE', 'joo', 1615309485610, NULL, 0);
INSERT INTO public.user_entity VALUES ('b3fb07c4-5b20-40d0-a741-0a8974ab2247', 'front-1@yopmail.com', 'front-1@yopmail.com', true, true, NULL, 'Front', 'Number one', 'FRONT', 'front-1', 1616415938925, NULL, 0);
INSERT INTO public.user_entity VALUES ('7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8', 'front-2@yopmail.com', 'front-2@yopmail.com', true, true, NULL, 'Front', 'Number two', 'FRONT', 'front-2', 1616415981781, NULL, 0);
INSERT INTO public.user_entity VALUES ('2aea0f0c-cca1-442e-8d9b-3953b1412340', 'front-3@yopmail.com', 'front-3@yopmail.com', true, true, NULL, 'Front', 'Number three', 'FRONT', 'front-3', 1616416030054, NULL, 0);
INSERT INTO public.user_entity VALUES ('5d830a22-4d1c-4901-aa54-550df5ac7e04', NULL, '44ad42fe-9791-4f84-9f22-9be188913641', false, true, NULL, NULL, NULL, 'MULTIPLE-1', 'service-account-multiple-1-client', 1616416271524, '1b608b0b-5877-4161-ab41-a96362c18a25', 0);
INSERT INTO public.user_entity VALUES ('77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b', 'multiple-1-1@yopmail.com', 'multiple-1-1@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-1', 'multiple-1-1', 1616416494327, NULL, 0);
INSERT INTO public.user_entity VALUES ('8b345759-96d0-460c-bc76-b40629bb321e', 'multiple-1-2@yopmail.com', 'multiple-1-2@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-1', 'multiple-1-2', 1616416520288, NULL, 0);
INSERT INTO public.user_entity VALUES ('2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c', 'multiple-1-3@yopmail.com', 'multiple-1-3@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-1', 'multiple-1-3', 1616416548054, NULL, 0);
INSERT INTO public.user_entity VALUES ('d7b34026-db0a-45fc-98dd-2b0092c047ba', NULL, '6d173713-5964-4954-9590-9bef068d508d', false, true, NULL, NULL, NULL, 'MULTIPLE-2', 'service-account-multiple-2-client', 1616416600386, 'e7000013-78f1-40b5-8eb0-04aa09e8f169', 0);
INSERT INTO public.user_entity VALUES ('0a1087ac-e533-4bca-aecf-e701c8c74ef5', 'multiple-2-1@yopmail.com', 'multiple-2-1@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-2', 'multiple-2-1', 1616416619922, NULL, 0);
INSERT INTO public.user_entity VALUES ('b201ddad-9c54-49c1-b3da-148e88789b5b', 'multiple-2-2@yopmail.com', 'multiple-2-2@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-2', 'multiple-2-2', 1616416644551, NULL, 0);
INSERT INTO public.user_entity VALUES ('f1b286f3-f987-4238-84bd-63bbf41b33e7', 'multiple-2-3@yopmail.com', 'multiple-2-3@yopmail.com', true, true, NULL, 'multiple', 'multiple', 'MULTIPLE-2', 'multiple-2-3', 1616416678204, NULL, 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.user_role_mapping VALUES ('cc936d10-11d6-4455-a701-5e91bbccf24d', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a');
INSERT INTO public.user_role_mapping VALUES ('d27a49d3-fba8-49d9-8855-f3305a06d00b', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a');
INSERT INTO public.user_role_mapping VALUES ('3f5fbaf9-67f4-4d47-99d7-292ed84bab31', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a');
INSERT INTO public.user_role_mapping VALUES ('54698925-844c-4dcc-b505-4629d5a6191e', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a');
INSERT INTO public.user_role_mapping VALUES ('02f6b340-8db9-4c83-b073-013771964fdb', '01c4968a-56d8-4cc0-84d2-4f77cfb0142a');
INSERT INTO public.user_role_mapping VALUES ('6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('b3b1571d-04bc-4d55-a318-36d7fcae2453', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('b8f83c6a-0d16-4912-bba1-2b7a29e26fbd', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('1acacc43-0d2d-42b9-8a8f-d6f70199ed4f', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('14190a50-329c-4f33-8275-f195fedcf3ee', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('43e8dc52-5a19-43a4-9587-3ec511b0e43e', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('82795ac2-889a-444a-a316-2b9fb605bea0', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('a863f12a-ae2d-484f-98cb-08ffa84a497e', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('2709f748-0bb2-4f21-bd20-55f23a03d8c6', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('3be225df-e13c-45f4-b266-f584f17b7a27', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('29941611-a198-44aa-81c7-3eadbc278cea', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('3624d92a-a77e-45ab-9803-ea5ea9922b4b', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('18e81483-9069-48bc-9617-cc192d83cdfd', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('7a8f16f1-7151-4882-8263-bc67ec1e17c7', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('8144e680-6f56-40f1-9445-565dccc7bc25', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('6f7fb2a4-ce29-45e6-ba1c-cd2b85fb4397', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('3111a531-3168-46b4-b901-fcdd917242c3', 'ac4088d2-82e6-4087-8edf-3b7b5d72cf32');
INSERT INTO public.user_role_mapping VALUES ('6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9', '146c0cdb-130e-4dc2-b158-05bf2f6161cb');
INSERT INTO public.user_role_mapping VALUES ('b3b1571d-04bc-4d55-a318-36d7fcae2453', '146c0cdb-130e-4dc2-b158-05bf2f6161cb');
INSERT INTO public.user_role_mapping VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', '146c0cdb-130e-4dc2-b158-05bf2f6161cb');
INSERT INTO public.user_role_mapping VALUES ('b8f83c6a-0d16-4912-bba1-2b7a29e26fbd', '146c0cdb-130e-4dc2-b158-05bf2f6161cb');
INSERT INTO public.user_role_mapping VALUES ('6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9', '3fd205f6-d93b-4c04-9760-90a7ccd517ea');
INSERT INTO public.user_role_mapping VALUES ('b3b1571d-04bc-4d55-a318-36d7fcae2453', '3fd205f6-d93b-4c04-9760-90a7ccd517ea');
INSERT INTO public.user_role_mapping VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', '3fd205f6-d93b-4c04-9760-90a7ccd517ea');
INSERT INTO public.user_role_mapping VALUES ('b8f83c6a-0d16-4912-bba1-2b7a29e26fbd', '3fd205f6-d93b-4c04-9760-90a7ccd517ea');
INSERT INTO public.user_role_mapping VALUES ('6b8e51a5-c4f0-44e3-bff2-e5b6190b39e9', '0b491d91-a740-4c51-9ce7-6f51dd5a277c');
INSERT INTO public.user_role_mapping VALUES ('b3b1571d-04bc-4d55-a318-36d7fcae2453', '0b491d91-a740-4c51-9ce7-6f51dd5a277c');
INSERT INTO public.user_role_mapping VALUES ('5a7f1fa1-1419-4387-a8f4-e52e1415fb7b', '0b491d91-a740-4c51-9ce7-6f51dd5a277c');
INSERT INTO public.user_role_mapping VALUES ('b8f83c6a-0d16-4912-bba1-2b7a29e26fbd', '0b491d91-a740-4c51-9ce7-6f51dd5a277c');
INSERT INTO public.user_role_mapping VALUES ('282b3c25-fb38-4bda-96ff-087679995892', 'b3fb07c4-5b20-40d0-a741-0a8974ab2247');
INSERT INTO public.user_role_mapping VALUES ('9c020280-88eb-46f1-81a6-431ee2962be6', 'b3fb07c4-5b20-40d0-a741-0a8974ab2247');
INSERT INTO public.user_role_mapping VALUES ('d4c9d85b-026f-4f0c-b9ea-26219fe7bd4e', 'b3fb07c4-5b20-40d0-a741-0a8974ab2247');
INSERT INTO public.user_role_mapping VALUES ('1d74ae8d-2aa0-4118-a1bb-ae42f563923a', 'b3fb07c4-5b20-40d0-a741-0a8974ab2247');
INSERT INTO public.user_role_mapping VALUES ('282b3c25-fb38-4bda-96ff-087679995892', '7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8');
INSERT INTO public.user_role_mapping VALUES ('9c020280-88eb-46f1-81a6-431ee2962be6', '7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8');
INSERT INTO public.user_role_mapping VALUES ('d4c9d85b-026f-4f0c-b9ea-26219fe7bd4e', '7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8');
INSERT INTO public.user_role_mapping VALUES ('1d74ae8d-2aa0-4118-a1bb-ae42f563923a', '7632cfae-bf4a-4f7e-84f8-1c3b22d6efa8');
INSERT INTO public.user_role_mapping VALUES ('282b3c25-fb38-4bda-96ff-087679995892', '2aea0f0c-cca1-442e-8d9b-3953b1412340');
INSERT INTO public.user_role_mapping VALUES ('9c020280-88eb-46f1-81a6-431ee2962be6', '2aea0f0c-cca1-442e-8d9b-3953b1412340');
INSERT INTO public.user_role_mapping VALUES ('d4c9d85b-026f-4f0c-b9ea-26219fe7bd4e', '2aea0f0c-cca1-442e-8d9b-3953b1412340');
INSERT INTO public.user_role_mapping VALUES ('1d74ae8d-2aa0-4118-a1bb-ae42f563923a', '2aea0f0c-cca1-442e-8d9b-3953b1412340');
INSERT INTO public.user_role_mapping VALUES ('aab595cc-017f-4b4e-968f-979e5cef40ed', '5d830a22-4d1c-4901-aa54-550df5ac7e04');
INSERT INTO public.user_role_mapping VALUES ('ba529c8b-25a6-4ee5-809a-3850f0c1489e', '5d830a22-4d1c-4901-aa54-550df5ac7e04');
INSERT INTO public.user_role_mapping VALUES ('6bca112b-e6bc-4a33-b953-11500c629bd9', '5d830a22-4d1c-4901-aa54-550df5ac7e04');
INSERT INTO public.user_role_mapping VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', '5d830a22-4d1c-4901-aa54-550df5ac7e04');
INSERT INTO public.user_role_mapping VALUES ('13c07da1-bc0d-42e4-8564-3bf430818749', '5d830a22-4d1c-4901-aa54-550df5ac7e04');
INSERT INTO public.user_role_mapping VALUES ('aab595cc-017f-4b4e-968f-979e5cef40ed', '77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b');
INSERT INTO public.user_role_mapping VALUES ('ba529c8b-25a6-4ee5-809a-3850f0c1489e', '77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b');
INSERT INTO public.user_role_mapping VALUES ('6bca112b-e6bc-4a33-b953-11500c629bd9', '77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b');
INSERT INTO public.user_role_mapping VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', '77e5c4a8-18b4-4c7c-9a94-a8af9e41c11b');
INSERT INTO public.user_role_mapping VALUES ('aab595cc-017f-4b4e-968f-979e5cef40ed', '8b345759-96d0-460c-bc76-b40629bb321e');
INSERT INTO public.user_role_mapping VALUES ('ba529c8b-25a6-4ee5-809a-3850f0c1489e', '8b345759-96d0-460c-bc76-b40629bb321e');
INSERT INTO public.user_role_mapping VALUES ('6bca112b-e6bc-4a33-b953-11500c629bd9', '8b345759-96d0-460c-bc76-b40629bb321e');
INSERT INTO public.user_role_mapping VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', '8b345759-96d0-460c-bc76-b40629bb321e');
INSERT INTO public.user_role_mapping VALUES ('aab595cc-017f-4b4e-968f-979e5cef40ed', '2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c');
INSERT INTO public.user_role_mapping VALUES ('ba529c8b-25a6-4ee5-809a-3850f0c1489e', '2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c');
INSERT INTO public.user_role_mapping VALUES ('6bca112b-e6bc-4a33-b953-11500c629bd9', '2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c');
INSERT INTO public.user_role_mapping VALUES ('b416307b-5684-4bde-ac76-31a8ad58f11b', '2f2a9fb1-7d45-4a09-b7b2-93b80dd5bd9c');
INSERT INTO public.user_role_mapping VALUES ('603d02e8-11c0-40fc-a29f-ce0768218ed9', 'd7b34026-db0a-45fc-98dd-2b0092c047ba');
INSERT INTO public.user_role_mapping VALUES ('06399664-99af-42e6-9504-ab3ff4e61184', 'd7b34026-db0a-45fc-98dd-2b0092c047ba');
INSERT INTO public.user_role_mapping VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', 'd7b34026-db0a-45fc-98dd-2b0092c047ba');
INSERT INTO public.user_role_mapping VALUES ('86009589-4589-4207-84d3-21ed456de9a3', 'd7b34026-db0a-45fc-98dd-2b0092c047ba');
INSERT INTO public.user_role_mapping VALUES ('1a9cbeb7-c563-4ae3-8bb8-10a165276293', 'd7b34026-db0a-45fc-98dd-2b0092c047ba');
INSERT INTO public.user_role_mapping VALUES ('603d02e8-11c0-40fc-a29f-ce0768218ed9', '0a1087ac-e533-4bca-aecf-e701c8c74ef5');
INSERT INTO public.user_role_mapping VALUES ('06399664-99af-42e6-9504-ab3ff4e61184', '0a1087ac-e533-4bca-aecf-e701c8c74ef5');
INSERT INTO public.user_role_mapping VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', '0a1087ac-e533-4bca-aecf-e701c8c74ef5');
INSERT INTO public.user_role_mapping VALUES ('86009589-4589-4207-84d3-21ed456de9a3', '0a1087ac-e533-4bca-aecf-e701c8c74ef5');
INSERT INTO public.user_role_mapping VALUES ('603d02e8-11c0-40fc-a29f-ce0768218ed9', 'b201ddad-9c54-49c1-b3da-148e88789b5b');
INSERT INTO public.user_role_mapping VALUES ('06399664-99af-42e6-9504-ab3ff4e61184', 'b201ddad-9c54-49c1-b3da-148e88789b5b');
INSERT INTO public.user_role_mapping VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', 'b201ddad-9c54-49c1-b3da-148e88789b5b');
INSERT INTO public.user_role_mapping VALUES ('86009589-4589-4207-84d3-21ed456de9a3', 'b201ddad-9c54-49c1-b3da-148e88789b5b');
INSERT INTO public.user_role_mapping VALUES ('603d02e8-11c0-40fc-a29f-ce0768218ed9', 'f1b286f3-f987-4238-84bd-63bbf41b33e7');
INSERT INTO public.user_role_mapping VALUES ('06399664-99af-42e6-9504-ab3ff4e61184', 'f1b286f3-f987-4238-84bd-63bbf41b33e7');
INSERT INTO public.user_role_mapping VALUES ('ba49cc6b-a283-4227-8ab4-2ea356cc16fb', 'f1b286f3-f987-4238-84bd-63bbf41b33e7');
INSERT INTO public.user_role_mapping VALUES ('86009589-4589-4207-84d3-21ed456de9a3', 'f1b286f3-f987-4238-84bd-63bbf41b33e7');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.web_origins VALUES ('0fd56ece-f7b2-44af-b23c-d141d98accd0', '+');
INSERT INTO public.web_origins VALUES ('f42b647b-be8a-424e-841f-16dcc17fd78d', '+');
INSERT INTO public.web_origins VALUES ('966e01a0-fa00-4246-8e61-2bd871ab9877', '+');
INSERT INTO public.web_origins VALUES ('053fbb7b-a3ca-49c2-9888-20143c365d28', '+');
INSERT INTO public.web_origins VALUES ('00567daa-d087-40fc-beae-791ff3c17dba', '+');


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

