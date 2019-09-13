
#ifndef _MESSAGE_SIZE_CALCULATOR_H_
#define _MESSAGE_SIZE_CALCULATOR_H_

#include "MessageBufferInterface.h"

#include <limits> 

namespace EmbeddedProto 
{
  //! This class is used in a message to calculate the current serialized size.
  /*!
      To calculate the size of a message given the current data a dummy serialization is performed.
      This class mimics the buffer in which the data is stored. Instead of storing it, only the 
      size is incremented for the bytes pushed. No actual data is pushed into a buffer.

      \see MessageInterface::serialized_size()  
  */
  class MessageSizeCalculator : public MessageBufferInterface
  {
    public:
      MessageSizeCalculator()
        : size_(0)
      { 
      };

      ~MessageSizeCalculator() override = default;
      
      //! Reset the size count of the buffer.
      void clear() override 
      { 
        size_ = 0; 
      }

      //! Obtain the total number of bytes currently stored in the buffer.
      uint32_t get_size() const override 
      { 
        return size_; 
      }

      //! To continue serialization return the maximum number that fits in a 32bit unsigned int.
      uint32_t get_max_size() const override 
      { 
        return std::numeric_limits<uint32_t>::max(); 
      }

      //! To continue serialization return the maximum number that fits in a 32bit unsigned int.
      uint32_t get_available_size() const override 
      { 
        return std::numeric_limits<uint32_t>::max(); 
      }

      //! For calculating the size we just increment the counter and always return true.
      bool push(const uint8_t byte) override
      {
        // Ignore the unused parameter
        (void)byte;
        ++size_;
        return true;
      }

      //! Increment the size with the given length.
      bool push(const uint8_t* bytes, const uint32_t length) override
      {
        // Ignore the unused parameter
        (void)bytes;
        size_ += length;
        return true;
      }


    private:

      //! Not required functions for the calculator.1
      /*!
        The following functions are not required by the serialize functions. They are made private 
        to explicitly not use them. All parameters are void casted delibertely, default return 
        value is false.
        @{
      */
      bool peak(uint8_t& byte) const override { (void)byte; return false; }
      uint8_t peak() const override { return 0; }
      void advance() override {}
      void advance(const uint32_t N) override { (void)N; };
      bool pop(uint8_t& byte) override { return false; }
      uint8_t pop() override { return 0; }
      /*! @} */

      //! The calculated size of the buffer.
      uint32_t size_;

  }; // End of class MessageSizeCalculator

} // End of namespace EmbeddedProto

#endif 