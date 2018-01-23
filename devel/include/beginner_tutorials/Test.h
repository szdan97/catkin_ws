// Generated by gencpp from file beginner_tutorials/Test.msg
// DO NOT EDIT!


#ifndef BEGINNER_TUTORIALS_MESSAGE_TEST_H
#define BEGINNER_TUTORIALS_MESSAGE_TEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <beginner_tutorials/Point2D.h>
#include <std_msgs/Float32MultiArray.h>

namespace beginner_tutorials
{
template <class ContainerAllocator>
struct Test_
{
  typedef Test_<ContainerAllocator> Type;

  Test_()
    : a()
    , b(0.0)
    , c()  {
    }
  Test_(const ContainerAllocator& _alloc)
    : a(_alloc)
    , b(0.0)
    , c(_alloc)  {
  (void)_alloc;
    }



   typedef  ::beginner_tutorials::Point2D_<ContainerAllocator>  _a_type;
  _a_type a;

   typedef float _b_type;
  _b_type b;

   typedef std::vector< ::std_msgs::Float32MultiArray_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::std_msgs::Float32MultiArray_<ContainerAllocator> >::other >  _c_type;
  _c_type c;




  typedef boost::shared_ptr< ::beginner_tutorials::Test_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::beginner_tutorials::Test_<ContainerAllocator> const> ConstPtr;

}; // struct Test_

typedef ::beginner_tutorials::Test_<std::allocator<void> > Test;

typedef boost::shared_ptr< ::beginner_tutorials::Test > TestPtr;
typedef boost::shared_ptr< ::beginner_tutorials::Test const> TestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::beginner_tutorials::Test_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::beginner_tutorials::Test_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace beginner_tutorials

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'beginner_tutorials': ['/home/daniel/catkin_ws/src/beginner_tutorials/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::beginner_tutorials::Test_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::beginner_tutorials::Test_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::beginner_tutorials::Test_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::beginner_tutorials::Test_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::beginner_tutorials::Test_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::beginner_tutorials::Test_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::beginner_tutorials::Test_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5c369a168623ffa5c773a62397f3a9b4";
  }

  static const char* value(const ::beginner_tutorials::Test_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5c369a168623ffa5ULL;
  static const uint64_t static_value2 = 0xc773a62397f3a9b4ULL;
};

template<class ContainerAllocator>
struct DataType< ::beginner_tutorials::Test_<ContainerAllocator> >
{
  static const char* value()
  {
    return "beginner_tutorials/Test";
  }

  static const char* value(const ::beginner_tutorials::Test_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::beginner_tutorials::Test_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Point2D a\n\
float32 b\n\
std_msgs/Float32MultiArray[] c\n\
================================================================================\n\
MSG: beginner_tutorials/Point2D\n\
float64 x\n\
float64 y\n\
================================================================================\n\
MSG: std_msgs/Float32MultiArray\n\
# Please look at the MultiArrayLayout message definition for\n\
# documentation on all multiarrays.\n\
\n\
MultiArrayLayout  layout        # specification of data layout\n\
float32[]         data          # array of data\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/MultiArrayLayout\n\
# The multiarray declares a generic multi-dimensional array of a\n\
# particular data type.  Dimensions are ordered from outer most\n\
# to inner most.\n\
\n\
MultiArrayDimension[] dim # Array of dimension properties\n\
uint32 data_offset        # padding elements at front of data\n\
\n\
# Accessors should ALWAYS be written in terms of dimension stride\n\
# and specified outer-most dimension first.\n\
# \n\
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]\n\
#\n\
# A standard, 3-channel 640x480 image with interleaved color channels\n\
# would be specified as:\n\
#\n\
# dim[0].label  = \"height\"\n\
# dim[0].size   = 480\n\
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)\n\
# dim[1].label  = \"width\"\n\
# dim[1].size   = 640\n\
# dim[1].stride = 3*640 = 1920\n\
# dim[2].label  = \"channel\"\n\
# dim[2].size   = 3\n\
# dim[2].stride = 3\n\
#\n\
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.\n\
\n\
================================================================================\n\
MSG: std_msgs/MultiArrayDimension\n\
string label   # label of given dimension\n\
uint32 size    # size of given dimension (in type units)\n\
uint32 stride  # stride of given dimension\n\
";
  }

  static const char* value(const ::beginner_tutorials::Test_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::beginner_tutorials::Test_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.b);
      stream.next(m.c);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Test_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::beginner_tutorials::Test_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::beginner_tutorials::Test_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    s << std::endl;
    Printer< ::beginner_tutorials::Point2D_<ContainerAllocator> >::stream(s, indent + "  ", v.a);
    s << indent << "b: ";
    Printer<float>::stream(s, indent + "  ", v.b);
    s << indent << "c[]" << std::endl;
    for (size_t i = 0; i < v.c.size(); ++i)
    {
      s << indent << "  c[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::std_msgs::Float32MultiArray_<ContainerAllocator> >::stream(s, indent + "    ", v.c[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BEGINNER_TUTORIALS_MESSAGE_TEST_H