;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::DataToAssociate)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'DataToAssociate (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::DATATOASSOCIATE")
  (make-package "BEGINNER_TUTORIALS::DATATOASSOCIATE"))

(in-package "ROS")
;;//! \htmlinclude DataToAssociate.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass beginner_tutorials::DataToAssociate
  :super ros::object
  :slots (_features _featureCovMatrices _measurements ))

(defmethod beginner_tutorials::DataToAssociate
  (:init
   (&key
    ((:features __features) (let (r) (dotimes (i 0) (push (instance beginner_tutorials::Point2D :init) r)) r))
    ((:featureCovMatrices __featureCovMatrices) (let (r) (dotimes (i 0) (push (instance std_msgs::Float32MultiArray :init) r)) r))
    ((:measurements __measurements) (let (r) (dotimes (i 0) (push (instance beginner_tutorials::Point2D :init) r)) r))
    )
   (send-super :init)
   (setq _features __features)
   (setq _featureCovMatrices __featureCovMatrices)
   (setq _measurements __measurements)
   self)
  (:features
   (&rest __features)
   (if (keywordp (car __features))
       (send* _features __features)
     (progn
       (if __features (setq _features (car __features)))
       _features)))
  (:featureCovMatrices
   (&rest __featureCovMatrices)
   (if (keywordp (car __featureCovMatrices))
       (send* _featureCovMatrices __featureCovMatrices)
     (progn
       (if __featureCovMatrices (setq _featureCovMatrices (car __featureCovMatrices)))
       _featureCovMatrices)))
  (:measurements
   (&rest __measurements)
   (if (keywordp (car __measurements))
       (send* _measurements __measurements)
     (progn
       (if __measurements (setq _measurements (car __measurements)))
       _measurements)))
  (:serialization-length
   ()
   (+
    ;; beginner_tutorials/Point2D[] _features
    (apply #'+ (send-all _features :serialization-length)) 4
    ;; std_msgs/Float32MultiArray[] _featureCovMatrices
    (apply #'+ (send-all _featureCovMatrices :serialization-length)) 4
    ;; beginner_tutorials/Point2D[] _measurements
    (apply #'+ (send-all _measurements :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/Point2D[] _features
     (write-long (length _features) s)
     (dolist (elem _features)
       (send elem :serialize s)
       )
     ;; std_msgs/Float32MultiArray[] _featureCovMatrices
     (write-long (length _featureCovMatrices) s)
     (dolist (elem _featureCovMatrices)
       (send elem :serialize s)
       )
     ;; beginner_tutorials/Point2D[] _measurements
     (write-long (length _measurements) s)
     (dolist (elem _measurements)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/Point2D[] _features
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _features (let (r) (dotimes (i n) (push (instance beginner_tutorials::Point2D :init) r)) r))
     (dolist (elem- _features)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Float32MultiArray[] _featureCovMatrices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _featureCovMatrices (let (r) (dotimes (i n) (push (instance std_msgs::Float32MultiArray :init) r)) r))
     (dolist (elem- _featureCovMatrices)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; beginner_tutorials/Point2D[] _measurements
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _measurements (let (r) (dotimes (i n) (push (instance beginner_tutorials::Point2D :init) r)) r))
     (dolist (elem- _measurements)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get beginner_tutorials::DataToAssociate :md5sum-) "741a60cbfa41b774cb163e0c6d768d77")
(setf (get beginner_tutorials::DataToAssociate :datatype-) "beginner_tutorials/DataToAssociate")
(setf (get beginner_tutorials::DataToAssociate :definition-)
      "Point2D[] features
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



(provide :beginner_tutorials/DataToAssociate "741a60cbfa41b774cb163e0c6d768d77")


