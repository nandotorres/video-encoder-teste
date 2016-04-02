class Video < ActiveRecord::Base
  default_scope { order("created_at DESC") }
  scope :pending, -> { with_state(:pending) }
  scope :transcoding, -> { com_job_id.with_state(:transcoding) }
  scope :finished, -> { com_job_id.with_state(:finished) }
  scope :failed, -> { com_job_id.with_state(:failed) }
  scope :com_job_id, -> { where('job_id is not null') }

  validates_presence_of :arquivo_original

  mount_uploader :arquivo_original, VideoUploader

  state_machine initial: :pending do
    event :agendado do
      transition :pending => :transcoding
    end

    event :concluido do
      transition :transcoding => :finished
    end

    event :falhou do
      transition [:pending, :transcoding] => :failed
    end
  end

  def nome
    self.arquivo_original_identifier
  end

  def nome_sem_extensao
    nome.split('.')[0...-1].join
  end
end
