Worker = Struct.new(:worker_idx, :priority)
AssignedWorker = Struct.new(:worker_idx, :start_time)

class JobQueue
  def initialize
    @jobs = []
    @num_workers = 0
    @assigned_workers = []
  end

  def read_data
    @num_workers, _, *@jobs = STDIN.read.split.map(&:to_i)
  end

  def process
    @assigned_workers = []
    queue = MinHeap.new(@num_workers)

    @jobs.each.with_index do |time, idx|
      worker = queue.head
      @assigned_workers.push(AssignedWorker.new(worker.worker_idx, worker.priority))
      queue.change_priority(worker.priority + time)
    end
  end

  def write_output
    @assigned_workers.each { |w| puts "#{w.worker_idx} #{w.start_time}" }
  end
end

class MinHeap
  def initialize(num_workers)
    @data = num_workers.times.map { |i| Worker.new(i, 0) }
  end

  def change_priority(new_priority)
    @data[0].priority = new_priority
    sift_down(0)
  end

  def sift_down(idx)
    min_idx = idx
    min_idx = left_idx(idx) if swap_nodes?(min_idx, left_idx(idx))
    min_idx = right_idx(idx) if swap_nodes?(min_idx, right_idx(idx))
    if min_idx != idx
      @data[min_idx], @data[idx] = @data[idx], @data[min_idx]
      sift_down(min_idx)
    end
  end

  def head
    @data[0]
  end

  def inspect
    "MinHeap: #{@data}"
  end

  private

  def left_idx(idx)
    2 * idx + 1
  end

  def right_idx(idx)
    2 * idx + 2
  end

  def swap_nodes?(a_idx, b_idx)
    a_idx < @data.size && b_idx < @data.size &&
     (
       (@data[a_idx].priority > @data[b_idx].priority) ||
       (@data[a_idx].priority == @data[b_idx].priority && @data[a_idx].worker_idx > @data[b_idx].worker_idx)
     )
  end
end

job_queue = JobQueue.new
job_queue.read_data
job_queue.process
job_queue.write_output
