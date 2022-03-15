local status_ok, browse = pcall(require, "browse")
if not status_ok then
	return
end

function _G.browsefn()
	local bookmarks = {
		"https://confluence.ets.org/display/NLPARCH",
		"https://github.com/EducationalTestingService/factor_analyzer",
		"https://github.com/EducationalTestingService/rsmtool",
		"https://github.com/EducationalTestingService/rstfinder",
		"https://github.com/EducationalTestingService/skll",
		"https://github.com/kyazdani42/nvim-tree.lua",
		"https://github.com/rockerBOO/awesome-neovim",
		"https://neovimcraft.com",
	}
	browse.browse({ bookmarks = bookmarks })
end
