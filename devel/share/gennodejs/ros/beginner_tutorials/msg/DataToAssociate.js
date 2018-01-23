// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point2D = require('./Point2D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DataToAssociate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.features = null;
      this.featureCovMatrices = null;
      this.measurements = null;
    }
    else {
      if (initObj.hasOwnProperty('features')) {
        this.features = initObj.features
      }
      else {
        this.features = [];
      }
      if (initObj.hasOwnProperty('featureCovMatrices')) {
        this.featureCovMatrices = initObj.featureCovMatrices
      }
      else {
        this.featureCovMatrices = [];
      }
      if (initObj.hasOwnProperty('measurements')) {
        this.measurements = initObj.measurements
      }
      else {
        this.measurements = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DataToAssociate
    // Serialize message field [features]
    // Serialize the length for message field [features]
    bufferOffset = _serializer.uint32(obj.features.length, buffer, bufferOffset);
    obj.features.forEach((val) => {
      bufferOffset = Point2D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [featureCovMatrices]
    // Serialize the length for message field [featureCovMatrices]
    bufferOffset = _serializer.uint32(obj.featureCovMatrices.length, buffer, bufferOffset);
    obj.featureCovMatrices.forEach((val) => {
      bufferOffset = std_msgs.msg.Float32MultiArray.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [measurements]
    // Serialize the length for message field [measurements]
    bufferOffset = _serializer.uint32(obj.measurements.length, buffer, bufferOffset);
    obj.measurements.forEach((val) => {
      bufferOffset = Point2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DataToAssociate
    let len;
    let data = new DataToAssociate(null);
    // Deserialize message field [features]
    // Deserialize array length for message field [features]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.features = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.features[i] = Point2D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [featureCovMatrices]
    // Deserialize array length for message field [featureCovMatrices]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.featureCovMatrices = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.featureCovMatrices[i] = std_msgs.msg.Float32MultiArray.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [measurements]
    // Deserialize array length for message field [measurements]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.measurements = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.measurements[i] = Point2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.features.length;
    object.featureCovMatrices.forEach((val) => {
      length += std_msgs.msg.Float32MultiArray.getMessageSize(val);
    });
    length += 16 * object.measurements.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/DataToAssociate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '741a60cbfa41b774cb163e0c6d768d77';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Point2D[] features
    std_msgs/Float32MultiArray[] featureCovMatrices
    Point2D[] measurements
    ================================================================================
    MSG: beginner_tutorials/Point2D
    float64 x
    float64 y
    ================================================================================
    MSG: std_msgs/Float32MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    float32[]         data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DataToAssociate(null);
    if (msg.features !== undefined) {
      resolved.features = new Array(msg.features.length);
      for (let i = 0; i < resolved.features.length; ++i) {
        resolved.features[i] = Point2D.Resolve(msg.features[i]);
      }
    }
    else {
      resolved.features = []
    }

    if (msg.featureCovMatrices !== undefined) {
      resolved.featureCovMatrices = new Array(msg.featureCovMatrices.length);
      for (let i = 0; i < resolved.featureCovMatrices.length; ++i) {
        resolved.featureCovMatrices[i] = std_msgs.msg.Float32MultiArray.Resolve(msg.featureCovMatrices[i]);
      }
    }
    else {
      resolved.featureCovMatrices = []
    }

    if (msg.measurements !== undefined) {
      resolved.measurements = new Array(msg.measurements.length);
      for (let i = 0; i < resolved.measurements.length; ++i) {
        resolved.measurements[i] = Point2D.Resolve(msg.measurements[i]);
      }
    }
    else {
      resolved.measurements = []
    }

    return resolved;
    }
};

module.exports = DataToAssociate;
