if [ -d ~/.ssh ]; then
  echo '.ssh dir is ok, skipping.'
else
  mkdir -m 0700 ~/.ssh
fi

<% %w(id_rsa id_rsa.pub).each do |file| -%>
if [ -f ~/.ssh/<%= file %> ]; then
  echo 'ssh keys are ok, skipping.'
else
  cp files/<%= file %> ~/.ssh/
  chmod 0600 ~/.ssh/<%= file %>
fi
<% end -%>
