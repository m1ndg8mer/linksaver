module LinksHelper
  def perform_link(link)
    if link.private?
      name, href = 'Share', share_link_path(link)
    else
      name, href = 'Hide', hide_link_path(link)
    end

    link_to name, href, method: :patch, data: {confirm: 'You sure?'}, class: 'btn btn-primary'
  end

  # TODO
  def get_formatted_tags(tags)
    'Link have no tags'
  end
end
