import json


def extract_addresses(input_file, output_file):
    try:
        # Read JSON file
        with open(input_file, 'r') as f:
            data = json.load(f)

        # Open output file
        with open(output_file, 'w') as f:
            # Extract and write each address
            for item in data:
                if 'address' in item:
                    f.write(item['address'] + '\n')

        print(f"Addresses successfully extracted to {output_file}")

    except FileNotFoundError:
        print(f"Error: Input file {input_file} not found")
    except json.JSONDecodeError:
        print("Error: Invalid JSON format in input file")
    except Exception as e:
        print(f"An unexpected error occurred: {str(e)}")


if __name__ == "__main__":
    input_file = "5.json"
    output_file = "5.txt"
    extract_addresses(input_file, output_file)
