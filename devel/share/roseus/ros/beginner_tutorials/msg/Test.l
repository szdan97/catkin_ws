;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::Test)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'Test (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::TEST")
  (make-package "BEGINNER_TUTORIALS::TEST"))

(in-package "ROS")
;;//! \htmlinclude Test.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass beginner_tutorials::Test
  :super ros::object
  :slots (_a _b _c ))

(defmethod beginner_tutorials::Test
  (:init
   (&key
    ((:a __a) (instance beginner_tutorials::Point2D :init))
    ((:b __b) 0.0)
    ((:c __c) (let (r) (dotimes (i 0) (push (instance std_msgs::Float32MultiArray :init) r)) r))
    )
   (send-super :init)
   (setq _a __a)
   (setq _b (float __b))
   (setq _c __c)
   self)
  (:a
   (&rest __a)
   (if (keywordp (car __a))
       (send* _a __a)
     (progn
       (if __a (setq _a (car __a)))
       _a)))
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&rest __c)
   (if (keywordp (car __c))
       (send* _c __c)
     (progn
       (if __c (setq _c (car __c)))
       _c)))
  (:serialization-length
   ()
   (+
    ;; beginner_tutorials/Point2D _a
    (send _a :serialization-length)
    ;; float32 _b
    4
    ;; std_msgs/Float32MultiArray[] _c
    (apply #'+ (send-all _c :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/Point2D _a
       (send _a :serialize s)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; std_msgs/Float32MultiArray[] _c
     (write-long (length _c) s)
     (dolist (elem _c)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/Point2D _a
     (send _a :deserialize buf ptr-) (incf ptr- (send _a :serialization-length))
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; std_msgs/Float32MultiArray[] _c
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _c (let (r) (dotimes (i n) (push (instance std_msgs::Float32MultiArray :init) r)) r))
     (dolist (elem- _c)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get beginner_tutorials::Test :md5sum-) "5c369a168623ffa5c773a62397f3a9b4")
(setf (get beginner_tutorials::Test :datatype-) "beginner_tutorials/Test")
(setf (get beginner_tutorials::Test :definition-)
      "Point2D a
float32 b
std_msgs/Float32MultiArray[] c
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
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
")



(provide :beginner_tutorials/Test "5c369a168623ffa5c773a62397f3a9b4")


