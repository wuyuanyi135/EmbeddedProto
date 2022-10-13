protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/simple_types.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/nested_message.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/repeated_fields.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/oneof_fields.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/include_other_files.proto


protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/string_bytes.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/empty_message.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto --eams_out=./build/EAMS ./test/proto/optional_fields.proto
protoc --plugin=protoc-gen-eams=protoc-gen-eams.bat -I./test/proto -I./generator --eams_out=./build/EAMS ./test/proto/field_options.proto

protoc -I./test/proto --python_out=./build/python ./test/proto/simple_types.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/nested_message.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/repeated_fields.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/oneof_fields.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/include_other_files.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/file_to_include.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/subfolder/file_to_include_from_subfolder.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/empty_file_to_include.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/string_bytes.proto
protoc -I./test/proto --python_out=./build/python ./test/proto/optional_fields.proto
protoc -I./test/proto -I./generator --python_out=./build/python ./test/proto/field_options.proto
