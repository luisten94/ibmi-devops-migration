import os
import re

source_dir = "export_from_legacy"
dependencies = []

for root, dirs, files in os.walk(source_dir):
    for file in files:
        if file.endswith(".pgm"):
            path = os.path.join(root, file)

            with open(path) as f:
                lines = f.readlines()

            for line in lines:
                match = re.search(r'CALL\s+(\w+)', line)

                if match:
                    dependencies.append((file, match.group(1)))

print("\nDependency Analysis\n")

for dep in dependencies:
    print(f"{dep[0]} -> {dep[1]}")
