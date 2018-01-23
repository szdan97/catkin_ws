;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::DataToAssociate)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'DataToAssociate (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::DATATOASSOCIATE")
  (make-package "BEGINNER_TUTORIALS::DATATOASSOCIATE"))

(in-package "ROS")
;;//! \htmlinclude DataToAssociate.msg.html


(defclass beginner_tutorials::DataToAssociate
  :super ros::object
  :slots (_features _measurements ))

(defmethod beginner_tutorials::DataToAssociate
  (:init
   (&key
    ((:features __features) (let (r) (dotimes (i 0) (push (instance beginner_tutorials::Point2D :init) r)) r))
    ((:measurements __measurements) (let (r) (dotimes (i 0) (push (instance beginner_tutorials::Point2D :init) r)) r))
    )
   (send-super :init)
   (setq _features __features)
   (setq _measurements __measurements)
   self)
  (:features
   (&rest __features)
   (if (keywordp (car __features))
       (send* _features __features)
     (progn
       (if __features (setq _features (car __features)))
       _features)))
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

(setf (get beginner_tutorials::DataToAssociate :md5sum-) "cf1a37657f17395e5e520c0df0a9c904")
(setf (get beginner_tutorials::DataToAssociate :datatype-) "beginner_tutorials/DataToAssociate")
(setf (get beginner_tutorials::DataToAssociate :definition-)
      "Point2D[] features
Point2D[] measurements
================================================================================
MSG: beginner_tutorials/Point2D
float64 x
float64 y
")



(provide :beginner_tutorials/DataToAssociate "cf1a37657f17395e5e520c0df0a9c904")


