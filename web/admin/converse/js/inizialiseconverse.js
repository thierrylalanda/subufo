
        converse.initialize({
            bosh_service_url: 'http://messi:7070/http-bind/', // sbuce12174.sabc.cm Please use this connection manager only for testing purposes
            show_controlbox_by_default: false,
            keepalive: true,
            play_sounds: true,
            sounds_path: 'admin/converse/sounds/',
            allow_otr: true,
            locked_domain: 'messi',
            message_storage: 'local',
            registration_domain: 'messi',
            muc_nickname_from_jid: true,
            notify_all_room_messages: true,
            use_emojione: true,
            emojione_image_path: 'admin/converse/EmojiOne_3.1.1_32x32_png/',
            notification_icon: 'admin/converse/logo/logo.png',
            show_send_button: true,
            synchronize_availability: true,
            use_vcards: true,
            allow_non_roster_messaging: true,
            i18n: locales['fr'],
            allow_chat_pending_contacts: true,
            auto_list_rooms: true,
            domain_placeholder: 'messi',
            authentication: 'login',
            //auto_login: true,
            //jid: username+'messi',
            //password: password,
            //auto_reconnect: true,
            visible_toolbar_buttons: {
                call: false,
                clear: true,
                emoji: true,
                toggle_participants: true
            }
        });
   
