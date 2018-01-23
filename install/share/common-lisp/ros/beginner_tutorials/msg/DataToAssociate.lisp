; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude DataToAssociate.msg.html

(cl:defclass <DataToAssociate> (roslisp-msg-protocol:ros-message)
  ((features
    :reader features
    :initarg :features
    :type (cl:vector beginner_tutorials-msg:Point2D)
   :initform (cl:make-array 0 :element-type 'beginner_tutorials-msg:Point2D :initial-element (cl:make-instance 'beginner_tutorials-msg:Point2D)))
   (measurements
    :reader measurements
    :initarg :measurements
    :type (cl:vector beginner_tutorials-msg:Point2D)
   :initform (cl:make-array 0 :element-type 'beginner_tutorials-msg:Point2D :initial-element (cl:make-instance 'beginner_tutorials-msg:Point2D))))
)

(cl:defclass DataToAssociate (<DataToAssociate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataToAssociate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataToAssociate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<DataToAssociate> is deprecated: use beginner_tutorials-msg:DataToAssociate instead.")))

(cl:ensure-generic-function 'features-val :lambda-list '(m))
(cl:defmethod features-val ((m <DataToAssociate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:features-val is deprecated.  Use beginner_tutorials-msg:features instead.")
  (features m))

(cl:ensure-generic-function 'measurements-val :lambda-list '(m))
(cl:defmethod measurements-val ((m <DataToAssociate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:measurements-val is deprecated.  Use beginner_tutorials-msg:measurements instead.")
  (measurements m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataToAssociate>) ostream)
  "Serializes a message object of type '<DataToAssociate>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'features))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'features))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'measurements))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'measurements))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataToAssociate>) istream)
  "Deserializes a message object of type '<DataToAssociate>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'features) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'features)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'beginner_tutorials-msg:Point2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'measurements) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'measurements)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'beginner_tutorials-msg:Point2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataToAssociate>)))
  "Returns string type for a message object of type '<DataToAssociate>"
  "beginner_tutorials/DataToAssociate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataToAssociate)))
  "Returns string type for a message object of type 'DataToAssociate"
  "beginner_tutorials/DataToAssociate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataToAssociate>)))
  "Returns md5sum for a message object of type '<DataToAssociate>"
  "cf1a37657f17395e5e520c0df0a9c904")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataToAssociate)))
  "Returns md5sum for a message object of type 'DataToAssociate"
  "cf1a37657f17395e5e520c0df0a9c904")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataToAssociate>)))
  "Returns full string definition for message of type '<DataToAssociate>"
  (cl:format cl:nil "Point2D[] features~%Point2D[] measurements~%================================================================================~%MSG: beginner_tutorials/Point2D~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataToAssociate)))
  "Returns full string definition for message of type 'DataToAssociate"
  (cl:format cl:nil "Point2D[] features~%Point2D[] measurements~%================================================================================~%MSG: beginner_tutorials/Point2D~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataToAssociate>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'features) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'measurements) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataToAssociate>))
  "Converts a ROS message object to a list"
  (cl:list 'DataToAssociate
    (cl:cons ':features (features msg))
    (cl:cons ':measurements (measurements msg))
))
