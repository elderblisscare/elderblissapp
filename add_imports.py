import re

files = [
    'lib/pages/appnavscreens/emergency_blog/emergency_blog_widget.dart',
    'lib/pages/appnavscreens/healthcareblog/healthcareblog_widget.dart',
    'lib/pages/appnavscreens/lifestyle_bog/lifestyle_bog_widget.dart',
]

for file_path in files:
    with open(file_path, 'r') as f:
        content = f.read()
    
    # Add the flutter_flow_theme import if not already present
    if 'flutter_flow_theme' not in content:
        # Find the import section and add the import after flutter_flow_util
        pattern = r"(import '/flutter_flow/flutter_flow_util.dart';)"
        replacement = r"\1\nimport '/flutter_flow/flutter_flow_theme.dart';"
        content = re.sub(pattern, replacement, content)
    
    with open(file_path, 'w') as f:
        f.write(content)
    
    print(f'Added theme import to: {file_path}')

print('All theme imports added')
