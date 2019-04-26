/* +---------------------------------------------------------------------------+
   |                     Mobile Robot Programming Toolkit (MRPT)               |
   |                          http://www.mrpt.org/                             |
   |                                                                           |
   | Copyright (c) 2005-2017, Individual contributors, see AUTHORS file        |
   | See: http://www.mrpt.org/Authors - All rights reserved.                   |
   | Released under BSD License. See details in http://www.mrpt.org/License    |
   +---------------------------------------------------------------------------+ */
#ifndef  mrpt_synch_semaphore_H
#define  mrpt_synch_semaphore_H

#include <string>
#include <mutex>
#include <condition_variable>
#include <exception>
#include <mrpt/base/link_pragmas.h>

namespace mrpt
{
	namespace synch
	{
		/** A semaphore for inter-thread synchronization.
		  * The state of a semaphore object is signaled when its count is greater than zero,
		  *  and nonsignaled when its count is equal to zero. The initialCount parameter specifies
		  *  the initial count. Each time a waiting thread is released because of the semaphore's
		  *  signaled state, the count of the semaphore is decreased by one. Use the release function
		  *  to increment a semaphore's count by a specified amount. The count can never be less
		  *   than zero or greater than the value specified in the maxCount parameter.
		  * \ingroup synch_grp
		  */
		class BASE_IMPEXP CSemaphore
		{
		protected:
			std::mutex m_mutex;
			std::condition_variable m_condition;
			unsigned long m_count{ 0 };

		public:
			/** Creates a semaphore.*/
			CSemaphore(unsigned int    initialCount, unsigned int    maxCount);

			// throw instead of deleting the copy operator to allow mrpt-1.5 legacy code to build.
			CSemaphore(const CSemaphore&o) { throw std::runtime_error("CSemaphore cannot be copied"); }

			/** Blocks until the count of the semaphore to be non-zero.
				* \param timeout_ms The timeout in milliseconds, or set to zero to wait indefinidely.
				* \return true if the semaphore has been signaled, false on timeout or any other error.
				*/
			bool waitForSignal( unsigned int timeout_ms = 0 );

			/** Increments the count of the semaphore by a given amount */
			void release(unsigned int increaseCount = 1);
		};

	} // End of namespace
} // End of namespace
#endif
