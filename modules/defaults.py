import os

root_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
ui_settings_file = os.path.join(root_path, 'configs', 'ui-settings.json')
ui_config_file = os.path.join(root_path, 'configs', 'ui-config.json')
style_files = os.path.join(root_path, 'configs', 'styles.csv')
