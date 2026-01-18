import json
import argparse
import sys
from pathlib import Path

def load_workflow(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def save_workflow(file_path, data):
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    print(f"Successfully saved to {file_path}")

def update_node_parameter(workflow, node_name, param_path, value):
    """
    Updates a parameter in a specific node.
    param_path: dot-separated path, e.g., "parameters.url"
    """
    found = False
    for node in workflow.get('nodes', []):
        if node['name'] == node_name:
            keys = param_path.split('.')
            target = node
            for key in keys[:-1]:
                target = target.setdefault(key, {})
            target[keys[-1]] = value
            found = True
            print(f"Updated {node_name}: {param_path} = {value}")
            break
    
    if not found:
        print(f"Node '{node_name}' not found.")
    return found

def main():
    parser = argparse.ArgumentParser(description="Patch n8n workflow JSON")
    parser.add_argument('file_path', help="Path to workflow JSON file")
    # Add more arguments as needed for specific patch operations
    
    args = parser.parse_args()
    
    try:
        workflow = load_workflow(args.file_path)
        
        # Example Operation: Fix Yahoo Timestamp
        # In a real scenario, you might pass arguments to decide what update to run
        # update_node_parameter(workflow, "Yahoo Finance (BTC Data)", "parameters.url", "NEW_URL")
        
        print("Workflow loaded. Implement specific patch logic here using 'update_node_parameter' or custom logic.")
        
        # save_workflow(args.file_path, workflow)

    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
