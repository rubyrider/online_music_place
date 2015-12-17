Rails.application.config.x.signature = YAML.load_file(Rails.root.join('config', 'signature.yml'))[Rails.env]['secret_key_base']
