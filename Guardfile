guard :shell do
  watch(/^.*\.hs$/) do |m|
    title = 'Build'
    eager 'make'
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
