"to support multiple output buffers run in the buffer
"let b:vrc_output_buffer_name = '__REST_1_OUTPUT__'

"let g:vrc_output_buffer_name = '__REST_response__.json'
"let g:vrc_response_default_content_type = 'application/json'
let g:vrc_curl_opts = {
  \ '-i': '',
  \ '-H': 'Content-Type: application/json; Accept: application/json',
\}
