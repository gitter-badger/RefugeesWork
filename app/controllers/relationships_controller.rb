def create
  @campaign = Campaign.find(params)[:relationship][:coowner_id]
  current_user.coown!(@campaign)
  redirect_to @campaign
end