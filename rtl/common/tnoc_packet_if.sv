`ifndef TNOC_PACKET_IF_SV
`define TNOC_PACKET_IF_SV
interface tnoc_packet_if
  import  tnoc_config_pkg::*;
#(
  parameter tnoc_config CONFIG  = TNOC_DEFAULT_CONFIG
)();
  `include  "tnoc_packet.svh"

  //  Header
  logic                 header_valid;
  logic                 header_ready;
  tnoc_packet_type      packet_type;
  tnoc_location_id      destination_id;
  tnoc_location_id      source_id;
  tnoc_vc               vc;
  tnoc_tag              tag;
  tnoc_routing_mode     routing_mode;
  logic                 invalid_destination;
  tnoc_burst_type       burst_type;
  tnoc_burst_length     burst_length;
  tnoc_burst_length     burst_size;
  tnoc_address          address;
  tnoc_response_status  status;
  //  Payload
  logic                 payload_valid;
  logic                 payload_ready;
  logic                 payload_last;
  tnoc_data             data;
  tnoc_byte_enable      byte_enable;

  modport initiator (
    output  header_valid,
    input   header_ready,
    output  packet_type,
    output  destination_id,
    output  source_id,
    output  vc,
    output  tag,
    output  routing_mode,
    output  invalid_destination,
    output  burst_type,
    output  burst_length,
    output  burst_size,
    output  address,
    output  status,
    output  payload_valid,
    input   payload_ready,
    output  payload_last,
    output  data,
    output  byte_enable
  );

  modport target (
    input   header_valid,
    output  header_ready,
    input   packet_type,
    input   destination_id,
    input   source_id,
    input   vc,
    input   tag,
    input   routing_mode,
    input   invalid_destination,
    input   burst_type,
    input   burst_length,
    input   burst_size,
    input   address,
    input   status,
    input   payload_valid,
    output  payload_ready,
    input   payload_last,
    input   data,
    input   byte_enable
  );

  modport monitor (
    input header_valid,
    input header_ready,
    input packet_type,
    input destination_id,
    input source_id,
    input vc,
    input tag,
    input routing_mode,
    input invalid_destination,
    input burst_type,
    input burst_length,
    input burst_size,
    input address,
    input status,
    input payload_valid,
    input payload_ready,
    input payload_last,
    input data,
    input byte_enable
  );
endinterface
`endif