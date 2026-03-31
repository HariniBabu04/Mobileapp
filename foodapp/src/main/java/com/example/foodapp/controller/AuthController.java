package com.example.foodapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import com.example.foodapp.service.DonationService;
import com.example.foodapp.service.UserService;
import com.example.foodapp.repository.UserRepository;
import com.example.foodapp.repository.DonationRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

	@Autowired
	private UserService userService;

	@Autowired
	private DonationService donationService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private DonationRepository donationRepository;
	
	



	// Show home Page
	@GetMapping("/")
	public String homePage() {
		return "home";
	}

	// ================= LOGIN PAGE =================
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	// ================= LOGIN PROCESS =================
	@PostMapping("/login")
	public String loginUser(@ModelAttribute User user,
	                        @RequestParam("role") String selectedRole,
	                        HttpSession session) {

	    User existingUser = userService.authenticateUser(user.getEmail(), user.getPassword());

	    if (existingUser != null) {

	        String role = existingUser.getRole();

	        if (role != null && role.equalsIgnoreCase(selectedRole)) {

	            // ⭐ STORE USER IN SESSION
	            session.setAttribute("loggedUser", existingUser);

	            if (role.equalsIgnoreCase("donor")) {
	                return "redirect:/donor-dashboard";
	            } 
	            else if (role.equalsIgnoreCase("ngo")) {
	                return "redirect:/ngo-dashboard";
	            } 
	            else if (role.equalsIgnoreCase("admin")) {
	                return "redirect:/admin-dashboard";
	            }
	        }
	    }

	    return "login";
	}

	// ================= REGISTER PAGE =================
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}

	// ================= REGISTER PROCESS =================

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user, RedirectAttributes ra) {

		boolean status = userService.registerUser(user);

		if (!status) {
			ra.addFlashAttribute("errorMessage", "Email already exists!");
			return "redirect:/register";
		}

		return "redirect:/login";
	}

	// Show forgot-password Page
	@GetMapping("/forgotPassword")
	public String ForgotPasswordPage() {
		return "forgotPassword";
	}

	// ================= LOGOUT =================
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// Show donor-dashboard Page
	@GetMapping("/donor-dashboard")
	public String DonorPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "donor-dashboard";
	}

	// Show add-donation Page
	@GetMapping("/addSurplusfood")
	public String AddDonationPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "addSurplusfood";
	}

	
	@PostMapping("/addSurplusfood")
	public String addDonation(Donation donation, HttpSession session) {

	    User loggedUser = (User) session.getAttribute("loggedUser");

	    if (loggedUser == null) {
	        return "redirect:/login";
	    }

	    if (!"donor".equalsIgnoreCase(loggedUser.getRole())) {
	        return "redirect:/login";
	    }

	    donation.setDonor(loggedUser);
	    donation.setStatus("CREATED");

	    donationService.saveDonation(donation);

	    return "redirect:/donor-dashboard";
	}

	// NGO Accepts Donation
	@GetMapping("/acceptDonation/{id}")
	public String acceptDonation(@PathVariable Integer id, HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		donationService.acceptDonation(id, loggedUser);
		return "redirect:/ngo-dashboard";
	}



	// Show manage-donation Page
	@GetMapping("/manageDonation")
	public String ManageDonationPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		List<Donation> donorDonations = donationService.getDonationsByDonor(loggedUser);
		model.addAttribute("donations", donorDonations);
		return "manageDonation";
	}

	// Show donation-status Page
	@GetMapping("/donation-status")
	public String DonationStatusPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		List<Donation> donorDonations = donationService.getDonationsByDonor(loggedUser);
		model.addAttribute("donations", donorDonations);
		return "donation-status";
	}

	// Show settings Page
	@GetMapping("/settings")
	public String SettingsPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null) {
			return "redirect:/login";
		}
		return "settings";
	}

	// Show ngo-dashboard Page
	@GetMapping("/ngo-dashboard")
	public String NGOPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		model.addAttribute("totalDonations", donationService.getDonationsByNgo(loggedUser).size());
		model.addAttribute("acceptedDonations", donationService.getDonationsByStatusAndNgo("ACCEPTED", loggedUser).size());
		model.addAttribute("pendingDonations", donationService.getDonationsByStatus("CREATED").size());
		model.addAttribute("recentDonations", donationService.getDonationsByNgo(loggedUser));
		return "ngo-dashboard";
	}

	// Show ngo-dashboard Page
	@GetMapping("/viewDonation")
	public String ViewDonationPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		List<Donation> availableDonations = donationService.getDonationsByStatus("CREATED");
		model.addAttribute("donations", availableDonations);
		return "viewDonation";
	}

	// Show ngo-dashboard Page
	@GetMapping("/search-food")
	public String SearchFoodPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "search-food";
	}

	// Show ngo-dashboard Page
	@GetMapping("/view-map")
	public String ViewMapPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "view-map";
	}

	// Show ngo-dashboard Page
	@GetMapping("/acceptDonation")
	public String AcceptDonationPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "acceptDonation";
	}

	// Show ngo-dashboard Page
	@GetMapping("/pickup")
	public String PickupPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "pickup";
	}

	// Show admin-dashboard Page
	@GetMapping("/admin-dashboard")
	public String AdminPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		model.addAttribute("totalUsers", userRepository.count());
		model.addAttribute("totalDonations", donationRepository.count());
		model.addAttribute("recentDonations", donationRepository.findAll());
		return "admin-dashboard";
	}

	// Show manage-users Page
	@GetMapping("/manageUsers")
	public String ManageUsersPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		model.addAttribute("users", userRepository.findAll());
		return "manageUsers";
	}

	// Show manage donation-admin Page
	@GetMapping("/manageDonation-admin")
	public String ManageDonationAdminPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		model.addAttribute("donations", donationRepository.findAll());
		return "manageDonation-admin";
	}

	// Show notification-status Page
	@GetMapping("/notification-status")
	public String NotificationStatusPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "notification-status";
	}

	// Show reports-analytics Page
	@GetMapping("/reports-analytics")
	public String ReportsAnalysisPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "reports-analytics";
	}

	// Show edit-user Page
	@GetMapping("/editUser")
	public String EditUserPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "editUser";
	}

	// Show edit-donation Page
	@GetMapping("/editDonation")
	public String EditDonationPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || (!"admin".equalsIgnoreCase(loggedUser.getRole()) && !"donor".equalsIgnoreCase(loggedUser.getRole()))) {
			return "redirect:/login";
		}
		return "editDonation";
	}

	// Show view-user Page
	@GetMapping("/viewUser")
	public String ViewUserPage(HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		return "viewUser";
	}

}
